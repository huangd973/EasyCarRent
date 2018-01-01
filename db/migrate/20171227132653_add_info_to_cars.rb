class AddInfoToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :year, :integer
    add_column :cars, :engine, :string
    add_column :cars, :odometer, :string
    add_column :cars, :nb_door, :string
    add_column :cars, :places, :integer
    add_column :cars, :gearbox, :string
    add_column :cars, :consommation, :string
    add_column :cars, :type, :string
  end
end
