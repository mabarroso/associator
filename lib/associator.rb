require "associator/engine"

module Associator
end

class ActiveRecord::Base
	def self.associated	opts={}
		@@from_type = name.downcase
		if opts[:with]
			@@to_type = opts[:with].to_s.downcase
			# http://stackoverflow.com/questions/8545360/finder-sql-does-not-parse-string-with-rails
      has_many @@to_type, :finder_sql => ->(record) do
        record = self if(record.nil?)
        "
				SELECT 'groups'.* FROM groups
					INNER JOIN 'associations' ON ('groups'.'id' = 'associations'.'to'
					  AND 'associations'.'from' = #{record.id}
					  AND 'associations'.'from_type' = '#{@@from_type}'
					  AND 'associations'.'to_type' = '#{@@to_type}'
					)
			  "
      end
    end
	end

  def add_associated obj
  	Associator::Association.create(:from => id, :from_type => @@from_type, :to => obj.id, :to_type => @@to_type, :key => "#{id}_#{obj.id}")
	end

end
