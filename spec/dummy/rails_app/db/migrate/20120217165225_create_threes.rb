class CreateThrees < ActiveRecord::Migration
  def change
    create_table :threes do |t|
      t.string :value

      t.timestamps
    end
  end
end
