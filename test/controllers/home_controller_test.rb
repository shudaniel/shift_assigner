require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "home index test" do
  	get home_index_url
  	assert :success
  end

  test "home index should be root" do 
  	skip
  	assert_routing root_url, controller: 'home', action: 'index'
  end
end
