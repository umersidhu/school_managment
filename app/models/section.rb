class Section < ApplicationRecord
  belongs_to :branch_class

  has_many   :student_sections
  has_many   :students, through: :student_sections, source: :user

  has_many   :teaching_subjects
  has_many   :teachers, through: :teaching_subjects, source: :user

  has_many   :section_subject_tests

  has_many   :section_subjects
  has_many   :subjects, through: :section_subjects

  has_many   :attendances

  enum section: [:A, :B, :C, :D]
end
