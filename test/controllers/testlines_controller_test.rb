require 'test_helper'

class TestlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testline = testlines(:one)
  end

  test "should get index" do
    get testlines_url
    assert_response :success
  end

  test "should get new" do
    get new_testline_url
    assert_response :success
  end

  test "should create testline" do
    assert_difference('Testline.count') do
      post testlines_url, params: { testline: {  } }
    end

    assert_redirected_to testline_url(Testline.last)
  end

  test "should show testline" do
    get testline_url(@testline)
    assert_response :success
  end

  test "should get edit" do
    get edit_testline_url(@testline)
    assert_response :success
  end

  test "should update testline" do
    patch testline_url(@testline), params: { testline: {  } }
    assert_redirected_to testline_url(@testline)
  end

  test "should destroy testline" do
    assert_difference('Testline.count', -1) do
      delete testline_url(@testline)
    end

    assert_redirected_to testlines_url
  end
end
