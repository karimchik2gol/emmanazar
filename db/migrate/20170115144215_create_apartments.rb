class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.integer :num
      t.integer :project_id
      t.string :apartment_type
      t.float :general_square
      t.float :living_square
      t.integer :floor
      t.integer :room_count
      t.float :price

      t.timestamps
    end
  end
end
