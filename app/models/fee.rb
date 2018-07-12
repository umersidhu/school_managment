class Fee < ApplicationRecord
  belongs_to :branch_class
  has_many   :user_feeses, dependent: :destroy
end
