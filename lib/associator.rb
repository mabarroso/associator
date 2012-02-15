require "associator/engine"

module Associator
	def self.included(base)
	end

end

class ActiveRecord::Base
	def self.associated	opts={}
		@from_type = name.downcase
		if opts[:with]
			@to_type = opts[:with].to_s.downcase
			#has_many @to_type, :foreign_key => 'to', :conditions => {:from_type => @from_type, :to_type => @to_type}

#			class_eval <<-RUBY
#				class Association_#{@from_type}_#{@to_type} < ActiveRecord::Base
#					set_table_name :associations
#   				belongs_to :#{@from_type}
#   				belongs_to :#{@to_type}
#   			end
#      RUBY
#			has_many @to_type, :through => "Association_#{@from_type}_#{@to_type}", :foreign_key => 'to', :conditions => {:from_type => @from_type, :to_type => @to_type}
#			has_and_belongs_to_many @to_type, :join_table => :associations, :foreign_key => 'from', :association_foreign_key => 'to', :conditions => {"association.from_type" => @from_type, "association.to_type" => @to_type}

			has_and_belongs_to_many :ar, :join_table => :associations, :finder_sql => "
				SELECT 'groups'.* FROM 'groups'
					INNER JOIN 'associations' ON ('groups'.'id' = 'associations'.'to' AND 'associations'.'from' = 1 AND 'association'.'from_type' = 'group' AND 'association'.'to_type' = 'group')
			"
		end
	end

  def add_associated obj
  	Associator::Association.create(:from => id, :from_type => @from_type, :to => obj.id, :to_type => obj.name.downcase, :key => "#{id}_#{obj.id}")
	end

	private

end
