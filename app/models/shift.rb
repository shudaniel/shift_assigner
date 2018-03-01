class Shift < ApplicationRecord
  belongs_to :calendar
  def self.format_datetime(dateTime)
    # Returns date in this format: "Fri 11:59 PM"
    dateTime.strftime("%a %l:%M %p")
  end

  def set_shift_description
    self.description = self.title + "\nAssigned To:" 
    self.assigned_to.each do |employee_id|
      employee = Employee.find(employee_id)
      self.description += "\n\##{employee.employee_num} #{employee.name}"
    end 
  end
end
