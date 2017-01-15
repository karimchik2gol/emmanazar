class CreateYurists < ActiveRecord::Migration[5.0]
  def change
    create_table :yurists do |t|
      t.string :status

      t.timestamps
    end
  end
end
