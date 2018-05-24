class StudentSection < ApplicationRecord
  belongs_to :user
  belongs_to :section
  validates_uniqueness_of :user_id, :scope => :section_id
end
