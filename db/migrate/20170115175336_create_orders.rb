class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :physical_id
      t.integer :broker_id
      t.integer :apartment_id

      t.timestamps
    end
  end
end
