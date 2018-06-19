class CreateSectionSubjectTests < ActiveRecord::Migration[5.1]
  def change
    create_table :section_subject_tests do |t|
      t.references :section_subject
      t.string     :name
      t.float      :total_marks
      t.timestamps
    end
  end
end
