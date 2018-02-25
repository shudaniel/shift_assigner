class User < ApplicationRecord
	has_many :calendars, dependent: :destroy

	validates :name, presence: true
end
