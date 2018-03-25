require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do 
    @calendar = calendars(:one)
    
  end

  test "set employee params should create a new employee if cannot find one with matching email" do
    skip
    params = {name: "Dan", email: "email@email.com"}
    assert_difference('@calendar.employees.count', 1) do
      @calendar.set_employee_preferences(params)
    end
  end

  test "set employee params should update an existing employee if finds matching email" do
    skip
    params = {name: "Dan", email: "MyString@email.com"}

    assert_difference('@calendar.employees.count', 0) do
      @calendar.set_employee_preferences(params)
    end

    employee = Employee.all.find_by(email: params[:email])
    assert_equals "Daniel Shu", employee.name
  end
end
