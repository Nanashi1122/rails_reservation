class AddColumnArea < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :area, :integer
  end
end
