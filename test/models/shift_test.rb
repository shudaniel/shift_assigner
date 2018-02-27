require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "format_datetime method should format the date correctly" do

  	assert_equal "Mon  4:55 PM", Shift.format_datetime(shifts(:one).start_time)
  end
end
