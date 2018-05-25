class BranchClass < ApplicationRecord
  belongs_to :branch
  has_many :sections, dependent: :destroy
  has_many :subjects, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_uniqueness_of :name
end
