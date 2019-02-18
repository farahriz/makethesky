require 'test_helper'

class ScarvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scarf = scarves(:one)
  end

  test "should get index" do
    get scarves_url
    assert_response :success
  end

  test "should get new" do
    get new_scarf_url
    assert_response :success
  end

  test "should create scarf" do
    assert_difference('Scarf.count') do
      post scarves_url, params: { scarf: { city_insp: @scarf.city_insp, date_insp: @scarf.date_insp, description: @scarf.description, pattern: @scarf.pattern, title: @scarf.title } }
    end

    assert_redirected_to scarf_url(Scarf.last)
  end

  test "should show scarf" do
    get scarf_url(@scarf)
    assert_response :success
  end

  test "should get edit" do
    get edit_scarf_url(@scarf)
    assert_response :success
  end

  test "should update scarf" do
    patch scarf_url(@scarf), params: { scarf: { city_insp: @scarf.city_insp, date_insp: @scarf.date_insp, description: @scarf.description, pattern: @scarf.pattern, title: @scarf.title } }
    assert_redirected_to scarf_url(@scarf)
  end

  test "should destroy scarf" do
    assert_difference('Scarf.count', -1) do
      delete scarf_url(@scarf)
    end

    assert_redirected_to scarves_url
  end
end
