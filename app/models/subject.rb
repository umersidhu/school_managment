class Subject < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :branch_class, optional: true

  has_many   :teaching_subjects
  has_many   :users, through: :teaching_subjects

  has_many   :section_subject_tests

  has_many   :section_subjects
  has_many   :sections, through: :section_subjects
end
