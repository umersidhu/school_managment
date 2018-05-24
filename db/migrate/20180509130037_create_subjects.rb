class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.references :branch_class
      t.string :title
      t.string :slug
      t.timestamps
    end
  end
end
