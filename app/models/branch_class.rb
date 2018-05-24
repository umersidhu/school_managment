class BranchClass < ApplicationRecord
  belongs_to :branch
  has_many :sections
  has_many :subjects
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_uniqueness_of :name
end
