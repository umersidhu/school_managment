class School < ApplicationRecord
  has_many :branches, dependent: :destroy
  
  validates :name, :status, presence: true
  validates_uniqueness_of :name
  enum status: [:inactive, :active]

  scope :active, -> { where(status: School.statuses[:active])}
  scope :in_active, -> { where(status: School.statuses[:inactive])}
end
