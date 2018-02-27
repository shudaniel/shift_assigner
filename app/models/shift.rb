class Shift < ApplicationRecord
  belongs_to :calendar
  def self.format_datetime(dateTime)
    # Returns date in this format: "Fri 11:59 PM"
    dateTime.strftime("%a %l:%M %p")
  end
end
