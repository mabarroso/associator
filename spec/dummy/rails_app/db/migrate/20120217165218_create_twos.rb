class CreateTwos < ActiveRecord::Migration
  def change
    create_table :twos do |t|
      t.string :value

      t.timestamps
    end
  end
end
