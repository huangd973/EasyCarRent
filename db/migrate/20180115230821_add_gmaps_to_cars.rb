class AddGmapsToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :gmaps, :string
  end
end
