require 'test_helper'

class TeamTestlinesControllerTest < ActionController::TestCase
  setup do
    @team_testline = team_testlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_testlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_testline" do
    assert_difference('TeamTestline.count') do
      post :create, team_testline: { team_id: @team_testline.team_id, testline_id: @team_testline.testline_id }
    end

    assert_redirected_to team_testline_path(assigns(:team_testline))
  end

  test "should show team_testline" do
    get :show, id: @team_testline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_testline
    assert_response :success
  end

  test "should update team_testline" do
    patch :update, id: @team_testline, team_testline: { team_id: @team_testline.team_id, testline_id: @team_testline.testline_id }
    assert_redirected_to team_testline_path(assigns(:team_testline))
  end

  test "should destroy team_testline" do
    assert_difference('TeamTestline.count', -1) do
      delete :destroy, id: @team_testline
    end

    assert_redirected_to team_testlines_path
  end
end
