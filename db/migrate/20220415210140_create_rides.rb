class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.integer :identifier
      t.string :startstation
      t.string :endstation
      t.timestamps
    end
  end
end
