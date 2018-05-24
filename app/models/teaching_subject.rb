class TeachingSubject < ApplicationRecord
	belongs_to :subject
	belongs_to :section
	belongs_to :user
end
