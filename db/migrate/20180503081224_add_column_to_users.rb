class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :integer
    add_column :users, :mobile_number, :string
    add_column :users, :school_id, :integer
    add_index :users, :school_id
  end
end
