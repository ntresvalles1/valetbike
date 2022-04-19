class AddBirthdayToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthMonth, :string
    add_column :users, :birthDay, :integer
    add_column :users, :birthYear, :integer
  end
end
