class CreateFours < ActiveRecord::Migration
  def change
    create_table :fours do |t|
      t.string :value

      t.timestamps
    end
  end
end
