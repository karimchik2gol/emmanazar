class CreateOrderYurists < ActiveRecord::Migration[5.0]
  def change
    create_table :order_yurists do |t|
      t.integer :project_id
      t.integer :apartment_id
      t.integer :yurist_id

      t.timestamps
    end
  end
end
