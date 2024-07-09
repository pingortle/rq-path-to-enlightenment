require "test_helper"

class KoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @koan = koans(:one)
  end

  test "should get index" do
    get koans_url
    assert_response :success
  end

  test "should get new" do
    get new_koan_url
    assert_response :success
  end

  test "should create koan" do
    assert_difference("Koan.count") do
      post koans_url, params: { koan: { description: @koan.description, initial_code: @koan.initial_code, order: @koan.order, title: @koan.title } }
    end

    assert_redirected_to koan_url(Koan.last)
  end

  test "should show koan" do
    get koan_url(@koan)
    assert_response :success
  end

  test "should get edit" do
    get edit_koan_url(@koan)
    assert_response :success
  end

  test "should update koan" do
    patch koan_url(@koan), params: { koan: { description: @koan.description, initial_code: @koan.initial_code, order: @koan.order, title: @koan.title } }
    assert_redirected_to koan_url(@koan)
  end

  test "should destroy koan" do
    assert_difference("Koan.count", -1) do
      delete koan_url(@koan)
    end

    assert_redirected_to koans_url
  end
end
