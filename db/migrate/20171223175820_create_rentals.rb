class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.date :starts_on
      t.date :ends_on
      t.integer :car_id
      t.integer :user_id

      t.timestamps
    end
  end
end
