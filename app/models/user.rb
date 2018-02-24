class User < ApplicationRecord
	has_many :calendars

	validates :name, presence: true
end
