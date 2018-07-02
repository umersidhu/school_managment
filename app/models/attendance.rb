class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :section

  enum status: [:present, :absent, :leave]
end
