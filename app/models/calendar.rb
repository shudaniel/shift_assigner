class Calendar < ApplicationRecord
  belongs_to :user
  has_many :shifts, dependent: :destroy
  has_many :employees, dependent: :destroy
end
