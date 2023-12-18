class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :name
      t.string :introduction
      t.integer :fee
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end