require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "should create building" do
    visit buildings_url
    click_on "New building"

    fill_in "Name", with: @building.name
    fill_in "Onwer", with: @building.onwer_id
    fill_in "Onwer type", with: @building.onwer_type
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "should update Building" do
    visit building_url(@building)
    click_on "Edit this building", match: :first

    fill_in "Name", with: @building.name
    fill_in "Onwer", with: @building.onwer_id
    fill_in "Onwer type", with: @building.onwer_type
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "should destroy Building" do
    visit building_url(@building)
    click_on "Destroy this building", match: :first

    assert_text "Building was successfully destroyed"
  end
end
