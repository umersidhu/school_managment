class Section < ApplicationRecord
  belongs_to :branch_class
  has_many   :student_sections
  has_many   :students, through: :student_sections, source: :user
  has_many   :teaching_subjects
  has_many   :teachers, through: :teaching_subjects, source: :user
  enum section: [:A, :B, :C, :D]
end
