require "application_system_test_case"

class ScarvesTest < ApplicationSystemTestCase
  setup do
    @scarf = scarves(:one)
  end

  test "visiting the index" do
    visit scarves_url
    assert_selector "h1", text: "Scarves"
  end

  test "creating a Scarf" do
    visit scarves_url
    click_on "New Scarf"

    fill_in "City insp", with: @scarf.city_insp
    fill_in "Date insp", with: @scarf.date_insp
    fill_in "Description", with: @scarf.description
    fill_in "Pattern", with: @scarf.pattern
    fill_in "Title", with: @scarf.title
    click_on "Create Scarf"

    assert_text "Scarf was successfully created"
    click_on "Back"
  end

  test "updating a Scarf" do
    visit scarves_url
    click_on "Edit", match: :first

    fill_in "City insp", with: @scarf.city_insp
    fill_in "Date insp", with: @scarf.date_insp
    fill_in "Description", with: @scarf.description
    fill_in "Pattern", with: @scarf.pattern
    fill_in "Title", with: @scarf.title
    click_on "Update Scarf"

    assert_text "Scarf was successfully updated"
    click_on "Back"
  end

  test "destroying a Scarf" do
    visit scarves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scarf was successfully destroyed"
  end
end
