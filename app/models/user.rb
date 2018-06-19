class User < ApplicationRecord
  enum role:   [:student, :admin, :school_admin, :teacher]
  enum status: [:inactive, :active]

  belongs_to :branch, optional: true
  has_many   :student_sections
  has_many   :section_students, through: :student_sections, source: :section

  has_many   :teaching_subjects, :foreign_key => :section_id
  has_many   :t_subjects, through: :teaching_subjects, source: :section

  has_many   :teaching_subjects
  has_many   :subjects, through: :teaching_subjects

  has_many   :user_tests
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :school_admin, -> { where(role: User.roles[:school_admin]).first}
  scope :admins, -> { where(role: User.roles[:admin])}
  scope :students, -> { where(role: User.roles[:student])}
  scope :teachers, -> { where(role: User.roles[:teacher])}
  scope :school_admins, -> { where(role: User.roles[:school_admin])}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
 
