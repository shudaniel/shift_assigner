class User < ApplicationRecord
  before_save { self.email = email.downcase }
	has_many :calendars, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
