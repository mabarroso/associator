class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :from
      t.string :from_type
      t.integer :to
      t.string :to_type
      t.string :key

      t.timestamps
    end
  end
end
