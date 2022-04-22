class AddDocksToStations < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :docks, :integer
  end
end
