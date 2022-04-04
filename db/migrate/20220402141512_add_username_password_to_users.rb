class AddUsernamePasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :identifier, :string
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :password, :string
    add_column :users, :email, :string
    add_column :users, :cash, :integer
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
  end
end
