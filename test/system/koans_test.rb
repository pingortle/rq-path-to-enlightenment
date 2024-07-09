require "application_system_test_case"

class KoansTest < ApplicationSystemTestCase
  setup do
    @koan = koans(:one)
  end

  test "visiting the index" do
    visit koans_url
    assert_selector "h1", text: "Koans"
  end

  test "should create koan" do
    visit koans_url
    click_on "New koan"

    fill_in "Description", with: @koan.description
    fill_in "Initial code", with: @koan.initial_code
    fill_in "Order", with: @koan.order
    fill_in "Title", with: @koan.title
    click_on "Create Koan"

    assert_text "Koan was successfully created"
    click_on "Back"
  end

  test "should update Koan" do
    visit koan_url(@koan)
    click_on "Edit this koan", match: :first

    fill_in "Description", with: @koan.description
    fill_in "Initial code", with: @koan.initial_code
    fill_in "Order", with: @koan.order
    fill_in "Title", with: @koan.title
    click_on "Update Koan"

    assert_text "Koan was successfully updated"
    click_on "Back"
  end

  test "should destroy Koan" do
    visit koan_url(@koan)
    click_on "Destroy this koan", match: :first

    assert_text "Koan was successfully destroyed"
  end
end
