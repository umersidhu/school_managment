class CreateStudentSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :student_subjects do |t|
      t.references :user
      t.references :subject
      t.timestamps
    end
  end
end
