class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.references :branch_class
      t.integer    :section
      t.timestamps
    end
  end
end
