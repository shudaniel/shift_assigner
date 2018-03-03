require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @employee = employees(:one)
  end
  
  test "email addresses should be unique" do
    duplicate_employee = @employee.dup
    assert_not duplicate_employee.valid?
  end

  test "emails should not have to be unique outside scope of a calendar" do
    duplicate_employee = @employee.dup
    duplicate_employee.calendar_id = calendars(:two).id

    assert duplicate_employee.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @employee.email = mixed_case_email
    @employee.save
    assert_equal mixed_case_email.downcase, @employee.reload.email
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @employee.email = invalid_address
      assert_not @employee.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
