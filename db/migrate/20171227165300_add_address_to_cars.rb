class AddAddressToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :address, :string
    add_column :cars, :city, :string
  end
end
