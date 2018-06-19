class SectionSubjectTest < ApplicationRecord
  has_many :user_tests
  belongs_to :section_subject
end
