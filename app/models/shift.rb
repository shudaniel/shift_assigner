class Shift < ApplicationRecord
  belongs_to :calendar
  validates :max_employees, :numericality => { :greater_than_or_equal_to => 0 }
  validates :title, presence: true


  def self.format_time_ampm(time)
    time.strftime("%l:%M %p")
  end

  def self.format_time_24hour(time)
    time.strftime("%k:%M")
  end

  def set_shift_description
    self.description = self.title + "\nAssigned To:" 
    self.assigned_to.each do |employee_id|
      employee = Employee.find(employee_id)
      self.description += "\n\##{employee.employee_num} #{employee.name}"
    end 
  end

  def set_day_of_week(shift_params)
    days_of_week = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    days_of_week.each do |weekday|
      self.weekdays << (shift_params["#{weekday}"]).to_i unless shift_params["#{weekday}"].nil?
    end
    self.weekdays = self.weekdays.uniq
  end

  def format_endtime
    #If the shift is overnight, fullcalendar needs the end time to be modified to account for going into the next day
    #For example, if a shift is from 17:00 - 3:00, then it needs to return 27:00 (24 + 3)

    if self.end_time < self.start_time
      new_hour = self.end_time.hour + 24
      return "#{new_hour}:#{self.end_time.min}"
    else
      return Shift.format_time_24hour(self.end_time)
    end

  end

  def get_weekdays_as_string

    days_of_week = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri"]
    weekday_string = ""
    self.weekdays.each do |index|
      weekday_string += days_of_week[index] + ", "
    end

    if weekday_string.empty?
      weekday_string = "No Days of the Week Assigned"
    else
      #Remove the comma and extra space at the end
      weekday_string = weekday_string.slice(0..-3)
    end
    return weekday_string
  end

end
