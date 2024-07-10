require "application_system_test_case"

class MinitestTestMethodsTest < ApplicationSystemTestCase
  setup do
    @minitest_test_method = minitest_test_methods(:one)
  end

  test "visiting the index" do
    visit minitest_test_methods_url
    assert_selector "h1", text: "Minitest test methods"
  end

  test "should create minitest test method" do
    visit minitest_test_methods_url
    click_on "New minitest test method"

    fill_in "Method body", with: @minitest_test_method.method_body
    fill_in "Method name", with: @minitest_test_method.method_name
    click_on "Create Minitest test method"

    assert_text "Minitest test method was successfully created"
    click_on "Back"
  end

  test "should update Minitest test method" do
    visit minitest_test_method_url(@minitest_test_method)
    click_on "Edit this minitest test method", match: :first

    fill_in "Method body", with: @minitest_test_method.method_body
    fill_in "Method name", with: @minitest_test_method.method_name
    click_on "Update Minitest test method"

    assert_text "Minitest test method was successfully updated"
    click_on "Back"
  end

  test "should destroy Minitest test method" do
    visit minitest_test_method_url(@minitest_test_method)
    click_on "Destroy this minitest test method", match: :first

    assert_text "Minitest test method was successfully destroyed"
  end
end
