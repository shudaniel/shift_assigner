class Calendar < ApplicationRecord
  belongs_to :user
  has_many :shifts, dependent: :destroy
  has_many :employees, dependent: :destroy

  def set_employee_preferences(params)
    # Parameters: { "employee_num"=>"234", 
    # "name"=>"Daniel Shu", 
    # "email"=>"email@email.com", 
    # "num_shifts"=>"3", 
    # "shift_1_Wed"=>"0", 
    # "shift_2_Tues"=>"0", 
    # "shift_3_Tues"=>"0", 
    # "shift_3_Wed"=>"0", 
    # "shift_3_Thurs"=>"0", 
    # "shift_4_Fri"=>"0", 
    # "shift_4_Sat"=>"0", 
    # "commit"=>"Save ", 
    # "calendar_id"=>"1"}
    puts self.employees.count

    employee = self.employees.find_by(email: params[:email])
    if employee.nil?
      employee = Employee.new(name: params[:name], email: params[:email])
      self.employees << employee
    else
      employee.name = params[:name]
    end
    employee.save

    preferred_shifts = params.select {|k,v| k.include? "shift@"}
    employee.set_preferences(preferred_shifts)
  end
end
