require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @employee = employees(:one)
    @user = users(:one)
    @user.add_role(:admin)
    sign_in @user
  end

  test "should get index" do
    get employees_url(calendar_id: @employee.calendar.id)
    assert_response :success
  end

  test "should get new" do
    get new_employee_url(calendar_id: @employee.calendar.id)
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { calendar_id: @employee.calendar.id, employee: { calendar_id: @employee.calendar_id, email: @employee.email, employee_num: @employee.employee_num, name: @employee.name } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { calendar_id: @employee.calendar_id, email: @employee.email, employee_num: @employee.employee_num, name: @employee.name } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url(calendar_id: calendars(:one).id)
  end
end
