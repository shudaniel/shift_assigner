require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "format_datetime method should format the date correctly" do

  	assert_equal "Mon  4:55 PM", Shift.format_datetime(shifts(:one).start_time)
  end

  test "set shift description method" do
    shift = shifts(:one)
    employee = employees(:one)
    shift.assigned_to = [employee.id]
    shift.set_shift_description

    assert_equal shift.description, "#{shift.title}\nAssigned To:\n\##{employee.employee_num} #{employee.name}"
  end
end
