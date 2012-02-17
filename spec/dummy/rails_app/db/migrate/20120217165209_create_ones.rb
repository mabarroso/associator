class CreateOnes < ActiveRecord::Migration
  def change
    create_table :ones do |t|
      t.string :value

      t.timestamps
    end
  end
end
