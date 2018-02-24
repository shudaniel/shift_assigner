require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "format_datetime method should format the date correctly" do

  	assert_equal "Mon  4:55 PM", Event.format_datetime(events(:one).start_time)
  end
end
