require 'test_helper'

class PatternsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get patterns_new_url
    assert_response :success
  end

  test "should get show" do
    get patterns_show_url
    assert_response :success
  end

end
