class AddRoomColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :introduction, :string
    add_column :rooms, :fee, :integer
    add_column :rooms, :address, :string
  end
end
