require "application_system_test_case"

class AppoitmentsTest < ApplicationSystemTestCase
  setup do
    @appoitment = appoitments(:one)
  end

  test "visiting the index" do
    visit appoitments_url
    assert_selector "h1", text: "Appoitments"
  end

  test "creating a Appoitment" do
    visit appoitments_url
    click_on "New Appoitment"

    fill_in "Description", with: @appoitment.description
    fill_in "End Time", with: @appoitment.end_time
    fill_in "Field", with: @appoitment.field_id
    fill_in "Start Time", with: @appoitment.start_time
    fill_in "User", with: @appoitment.user_id
    click_on "Create Appoitment"

    assert_text "Appoitment was successfully created"
    click_on "Back"
  end

  test "updating a Appoitment" do
    visit appoitments_url
    click_on "Edit", match: :first

    fill_in "Description", with: @appoitment.description
    fill_in "End Time", with: @appoitment.end_time
    fill_in "Field", with: @appoitment.field_id
    fill_in "Start Time", with: @appoitment.start_time
    fill_in "User", with: @appoitment.user_id
    click_on "Update Appoitment"

    assert_text "Appoitment was successfully updated"
    click_on "Back"
  end

  test "destroying a Appoitment" do
    visit appoitments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appoitment was successfully destroyed"
  end
end
