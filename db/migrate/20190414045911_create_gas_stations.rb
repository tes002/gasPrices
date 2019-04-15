class CreateGasStations < ActiveRecord::Migration[5.2]
  def change
    create_table :gas_stations do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :price

      t.timestamps
    end
  end
end
