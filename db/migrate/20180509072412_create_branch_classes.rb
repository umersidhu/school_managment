class CreateBranchClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :branch_classes do |t|
      t.references :branch
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
