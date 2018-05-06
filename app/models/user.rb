class User < ApplicationRecord
  enum role: [:user, :admin, :school_admin, :teacher]

  belongs_to :branch, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :school_admins, -> { where(role: User.roles[:school_admin])}
  scope :admins, -> { where(role: User.roles[:admin])}
  scope :students, -> { where(role: User.roles[:user])}
end
 