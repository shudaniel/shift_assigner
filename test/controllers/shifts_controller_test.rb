require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @shift = shifts(:one)
    @user = users(:one)
    @calendar = calendars(:one)
    @user.add_role(:admin)
    sign_in @user
  end

  test "should get new" do
    get new_shift_url
    assert_response :success
  end

  test "should create shift" do
    assert_difference('Shift.count') do
      post shifts_url, params: { calendar_id: @calendar.id, shift: { description: @shift.description, end_time: @shift.end_time, start_time: @shift.start_time, title: @shift.title } }
    end

    assert_redirected_to shift_url(Shift.last)
  end

  test "should show shift" do
    get shift_url(@shift)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_url(@shift)
    assert_response :success
  end

  test "should update shift" do
    patch shift_url(@shift), params: { shift: { description: @shift.description, end_time: @shift.end_time, start_time: @shift.start_time, title: @shift.title } }
    assert_redirected_to shift_url(@shift)
  end

  test "should destroy shift" do

    assert_difference('Shift.count', -1) do
      delete shift_url(@shift)
    end

    assert_redirected_to calendar_url(@calendar)
  end
end
