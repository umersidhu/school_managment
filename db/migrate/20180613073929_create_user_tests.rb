class CreateUserTests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tests do |t|
      t.references :section_subject_test
      t.references :user
      t.float      :obtained_marks, default: 0
      t.timestamps
    end
  end
end
