require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get teams" do
    get :teams
    assert_response :success
  end

  test "should get associations" do
    get :associations
    assert_response :success
  end

  test "should get testlines" do
    get :testlines
    assert_response :success
  end

end
