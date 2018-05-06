class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.references :school
      t.attachment :cover
      t.string :branch_name
      t.string :city
      t.text :address
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
