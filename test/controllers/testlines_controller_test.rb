require 'test_helper'

class TestlinesControllerTest < ActionController::TestCase
  setup do
    @testline = testlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testline" do
    assert_difference('Testline.count') do
      post :create, testline: { name: @testline.name }
    end

    assert_redirected_to testline_path(assigns(:testline))
  end

  test "should show testline" do
    get :show, id: @testline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testline
    assert_response :success
  end

  test "should update testline" do
    patch :update, id: @testline, testline: { name: @testline.name }
    assert_redirected_to testline_path(assigns(:testline))
  end

  test "should destroy testline" do
    assert_difference('Testline.count', -1) do
      delete :destroy, id: @testline
    end

    assert_redirected_to testlines_path
  end
end
