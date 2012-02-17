class CreateSevens < ActiveRecord::Migration
  def change
    create_table :sevens do |t|
      t.string :value

      t.timestamps
    end
  end
end
