require "application_system_test_case"

class PickupsTest < ApplicationSystemTestCase
  setup do
    @pickup = pickups(:one)
  end

  test "visiting the index" do
    visit pickups_url
    assert_selector "h1", text: "Pickups"
  end

  test "creating a Pickup" do
    visit pickups_url
    click_on "New Pickup"

    fill_in "Destination", with: @pickup.destination_id
    fill_in "Source", with: @pickup.source_id
    fill_in "Time", with: @pickup.time
    fill_in "User", with: @pickup.user_id
    click_on "Create Pickup"

    assert_text "Pickup was successfully created"
    click_on "Back"
  end

  test "updating a Pickup" do
    visit pickups_url
    click_on "Edit", match: :first

    fill_in "Destination", with: @pickup.destination_id
    fill_in "Source", with: @pickup.source_id
    fill_in "Time", with: @pickup.time
    fill_in "User", with: @pickup.user_id
    click_on "Update Pickup"

    assert_text "Pickup was successfully updated"
    click_on "Back"
  end

  test "destroying a Pickup" do
    visit pickups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pickup was successfully destroyed"
  end
end
