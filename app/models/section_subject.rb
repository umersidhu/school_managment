class SectionSubject < ApplicationRecord
  has_many   :section_subject_tests
  belongs_to :section
  belongs_to :subject
end
