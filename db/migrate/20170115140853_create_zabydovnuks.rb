class CreateZabydovnuks < ActiveRecord::Migration[5.0]
  def change
    create_table :zabydovnuks do |t|
      t.string :name
      t.integer :years_on_market, default: 0
      t.integer :projects_count, default: 0

      t.timestamps
    end
  end
end
