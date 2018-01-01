class AddPricekmToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :price_by_km, :numeric
  end
end
