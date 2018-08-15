class CreateStudentSections < ActiveRecord::Migration[5.1]
  def change
    create_table :student_sections do |t|
      t.references :user
      t.references :section
      t.integer    :status, default: 0
      t.timestamps
    end
  end
end
