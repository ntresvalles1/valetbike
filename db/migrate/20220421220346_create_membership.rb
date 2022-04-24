class CreateMembership < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.string :name
      t.integer :price
      t.integer :identifier
    end
  end
end
