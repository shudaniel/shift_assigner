require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @calendar = calendars(:one)
    @user.add_role(:admin)
    sign_in @user
  end

  test "should get index" do
    get calendars_url
    assert_response :success
  end

  test "calendars should only belongr to users that own them" do
    assert_equal @user.calendars.count, 1
  end 

  test "should get new" do
    get new_calendar_url
    assert_response :success
  end

  test "should get preferences" do
    get calendar_preferences_path(@calendar)
    assert_response :success
  end

  test "should create calendar" do
    assert_difference('Calendar.count') do
      post calendars_url, params: { calendar: { name: @calendar.name } }
    end

    assert_redirected_to calendar_url(Calendar.last)
  end

  test "should show calendar" do
    get calendar_url(@calendar)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendar_url(@calendar)
    assert_response :success
  end

  test "should update calendar" do
    patch calendar_url(@calendar), params: { calendar: { name: @calendar.name } }
    assert_redirected_to calendar_url(@calendar)
  end

  test "should destroy calendar" do
    assert_difference('Calendar.count', -1) do
      delete calendar_url(@calendar)
    end

    assert_redirected_to calendars_url
  end

  test "calendar should belong to user after created" do
    assert_difference('@user.calendars.count', 1) do
      post calendars_url, params: { calendar: { name: @calendar.name } }
    end
  end

  test "should not own other user's calendars" do
    assert_not_equal @user.calendars, Calendar.all
  end
end
