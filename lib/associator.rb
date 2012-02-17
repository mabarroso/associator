require "associator/engine"

module Associator
  class Association < ActiveRecord::Base
  end
end


class ActiveRecord::Base
	def self.associated	opts={}
		@@from_type = name.downcase
		if opts[:with]
			@@to_type = opts[:with].to_s.downcase
			@@class_name = opts[:class_name] || false
			@@table_name = @@to_type.pluralize if @@to_type
			@@table_name = @@class_name.pluralize if @@class_name
			@@table_name = opts[:table] if opts[:table]

			# http://stackoverflow.com/questions/8545360/finder-sql-does-not-parse-string-with-rails
			if @@class_name
	      has_many @@to_type, :class_name => @@class_name, :finder_sql => ->(record) do
	        finder record
	      end
			else
	      has_many @@to_type, :finder_sql => ->(record) do
	        finder record
	      end
			end
    end
	end

  def add_associated obj
  	Associator::Association.create(:from => id, :from_type => @@from_type, :to => obj.id, :to_type => @@to_type, :key => "#{id}_#{obj.id}")
#  	Association.create(:from => id, :from_type => @@from_type, :to => obj.id, :to_type => @@to_type, :key => "#{id}_#{obj.id}")
	end

	private
	def finder record
		record = self if(record.nil?)
	    "
		SELECT \"#{@@table_name}\".* FROM \"#{@@table_name}\"
			INNER JOIN \"associations\" ON (\"#{@@table_name}\".\"id\" = \"associations\".\"to\"
			  AND \"associations\".\"from\" = #{record.id}
			  AND \"associations\".\"from_type\" = '#{@@from_type}'
			  AND \"associations\".\"to_type\" = '#{@@to_type}'
			)
	  "
	end
end
