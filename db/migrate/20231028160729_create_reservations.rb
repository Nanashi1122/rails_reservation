class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.integer :day
      t.integer :num_of_people

      t.timestamps
    end
  end
end
