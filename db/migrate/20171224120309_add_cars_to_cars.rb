class AddCarsToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :cars, :json
  end
end
