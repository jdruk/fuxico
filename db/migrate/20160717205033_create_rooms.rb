class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :theme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
