class CreateSixes < ActiveRecord::Migration
  def change
    create_table :sixes do |t|
      t.string :value

      t.timestamps
    end
  end
end
