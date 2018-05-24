class Section < ApplicationRecord
  belongs_to :branch_class
  has_many   :student_sections
  has_many   :users, through: :student_sections
  enum section: [:A, :B, :C, :D]
end
