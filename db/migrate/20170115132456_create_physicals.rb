class CreatePhysicals < ActiveRecord::Migration[5.0]
  def change
    create_table :physicals do |t|
      t.string :passport
      t.string :card_number
      t.timestamp :born_date

      t.timestamps
    end
  end
end
