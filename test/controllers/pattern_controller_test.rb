require 'test_helper'

class PatternControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get pattern_request_url
    assert_response :success
  end

  test "should get result" do
    get pattern_result_url
    assert_response :success
  end

end
