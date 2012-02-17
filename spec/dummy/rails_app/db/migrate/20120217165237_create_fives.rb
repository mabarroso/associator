class CreateFives < ActiveRecord::Migration
  def change
    create_table :fives do |t|
      t.string :value

      t.timestamps
    end
  end
end
