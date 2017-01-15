class CreateBrokers < ActiveRecord::Migration[5.0]
  def change
    create_table :brokers do |t|
      t.string :name
      t.string :education
      t.integer :experience
      t.integer :experience_in_firm
      t.float :rating
      t.float :percent_for_service

      t.timestamps
    end
  end
end
