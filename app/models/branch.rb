class Branch < ApplicationRecord
  belongs_to :school
  has_many :users
  has_many :branch_classes


  validates :school_id, :branch_name, :cover, :city, :address, :status, presence: true
  validates_uniqueness_of :branch_name
  enum status: [:inactive, :active]

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
