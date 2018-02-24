require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "home index test" do
  	get home_index_url
  	assert :success
  end

end
