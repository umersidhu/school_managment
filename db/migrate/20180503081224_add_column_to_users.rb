class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :integer, default: 0
    add_column :users, :mobile_number, :string
    add_column :users, :branch_id, :integer
    add_index :users, :branch_id
  end
end
