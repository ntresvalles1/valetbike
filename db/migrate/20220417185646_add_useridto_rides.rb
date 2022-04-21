class AddUseridtoRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :rider_user_id, :integer
  end
end
