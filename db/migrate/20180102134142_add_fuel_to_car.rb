class AddFuelToCar < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :computerfueltank, :float
    add_column :cars, :fueltank, :float
  end
end
