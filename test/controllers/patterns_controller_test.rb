require 'test_helper'

class PatternsControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get patterns_request_url
    assert_response :success
  end

  test "should get result" do
    get patterns_result_url
    assert_response :success
  end

end
