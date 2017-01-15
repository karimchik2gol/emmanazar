class AddPersonIdToPhysicals < ActiveRecord::Migration[5.0]
  def change
    add_column :physicals, :person_id, :integer
    add_column :yurists, :person_id, :integer
  end
end
