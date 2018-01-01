class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :plaque

      t.timestamps
    end
  end
end
