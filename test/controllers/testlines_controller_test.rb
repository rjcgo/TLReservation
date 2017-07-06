require 'test_helper'

class TestlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testlines_index_url
    assert_response :success
  end

  test "should get new" do
    get testlines_new_url
    assert_response :success
  end

  test "should get edit" do
    get testlines_edit_url
    assert_response :success
  end

  test "should get show" do
    get testlines_show_url
    assert_response :success
  end

end
