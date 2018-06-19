class CreateSectionSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :section_subjects do |t|
      t.references :section
      t.references :subject

      t.timestamps
    end
  end
end
