class AddMembershipIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :membershipID, :integer
  end
end
