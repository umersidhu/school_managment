class CreateTeachingSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :teaching_subjects do |t|
    	t.references :user
    	t.references :subject
    	t.references :section
      t.timestamps
    end
  end
end
