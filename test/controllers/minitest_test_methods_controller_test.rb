require "test_helper"

class MinitestTestMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minitest_test_method = minitest_test_methods(:one)
  end

  test "should get index" do
    get minitest_test_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_minitest_test_method_url
    assert_response :success
  end

  test "should create minitest_test_method" do
    assert_difference("MinitestTestMethod.count") do
      post minitest_test_methods_url, params: { minitest_test_method: { method_body: @minitest_test_method.method_body, method_name: @minitest_test_method.method_name } }
    end

    assert_redirected_to minitest_test_method_url(MinitestTestMethod.last)
  end

  test "should show minitest_test_method" do
    get minitest_test_method_url(@minitest_test_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_minitest_test_method_url(@minitest_test_method)
    assert_response :success
  end

  test "should update minitest_test_method" do
    patch minitest_test_method_url(@minitest_test_method), params: { minitest_test_method: { method_body: @minitest_test_method.method_body, method_name: @minitest_test_method.method_name } }
    assert_redirected_to minitest_test_method_url(@minitest_test_method)
  end

  test "should destroy minitest_test_method" do
    assert_difference("MinitestTestMethod.count", -1) do
      delete minitest_test_method_url(@minitest_test_method)
    end

    assert_redirected_to minitest_test_methods_url
  end
end
