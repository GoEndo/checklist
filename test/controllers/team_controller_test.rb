require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "MnR Team Check-list"
  end

  test "should get index" do
    get teams_path
    assert_response :success
  end

  test "should get new" do
    get new_team_path
    assert_response :success
  end

  test "should get show" do
    get teams_path(teams(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_team_path(teams(:one))
    assert_response :success
  end

  test "should destroy" do
    assert_difference('Team.count', -1) do
      delete team_path(teams(:one))
    end

    assert_redirected_to teams_path
  end
end
