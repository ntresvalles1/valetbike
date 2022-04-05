class AddCoordsToStations < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :xcoord, :float
    add_column :stations, :ycoord, :float
  end
end
