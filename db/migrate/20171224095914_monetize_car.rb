class MonetizeCar < ActiveRecord::Migration[5.1]
  def change
    add_monetize :cars, :price
    add_monetize :rentals, :total_price
  end
end
