require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "format_time_ampm" do
  	assert_equal " 4:55 PM", Shift.format_time_ampm(shifts(:one).start_time)
  end

  test "format_time_24hour" do
    assert_equal "16:55", Shift.format_time_24hour(shifts(:one).start_time)
  end

  test "set shift description method" do
    shift = shifts(:one)
    employee = employees(:one)
    shift.assigned_to = [employee.id]
    shift.set_shift_description

    assert_equal shift.description, "#{shift.title}\nAssigned To:\n\##{employee.employee_num} #{employee.name}"
  end

  test "set day of week method" do
    shift_params = {"monday" => "1", "thursday" => "4"}
    shift = shifts(:one)
    shift.set_day_of_week(shift_params)

    assert_equal shift.weekdays, [1, 4]
  end

  test "after set_day_of_week is called, there should be no duplicate values in shift.weekdays" do
    shift_params = {"monday" => "1", "thursday" => "4"}
    shift = shifts(:one)

    assert_difference('shift.weekdays.count', 2) do
      shift.set_day_of_week(shift_params)
      shift.set_day_of_week(shift_params)
      shift.set_day_of_week(shift_params)
    end
  end

  test "format_endtime method should change output if end_time < start_time" do
    shift = shifts(:three)
    assert_equal "26:55", shift.format_endtime
  end
  
  test "format_endtime method should not change output if end_time > start_time" do
    shift = shifts(:one)
    assert_equal "16:55", shift.format_endtime
  end

  test "get weekdays as string" do
    assert_equal "Sun, Thurs, Fri", shifts(:three).get_weekdays_as_string
  end

  test "if shift has no weekdays assigned, get_weekdays_as_string should return a message saying so" do
    assert_equal "No Days of the Week Assigned", shifts(:one).get_weekdays_as_string
  end

end
