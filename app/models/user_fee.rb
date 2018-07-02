class UserFee < ApplicationRecord
  belongs_to :user
  belongs_to :fee
  enum status: [:pending, :submitted]
end
