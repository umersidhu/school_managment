class CreateStudentSections < ActiveRecord::Migration[5.1]
  def change
    create_table :student_sections do |t|
      t.references :user
      t.references :section
      t.timestamps
    end
  end
end
