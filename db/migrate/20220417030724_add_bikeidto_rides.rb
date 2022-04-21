class AddBikeidtoRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :bike_id, :integer
  end
end
