require 'test_helper'

class SprintsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sprints_path
    assert_response :success
  end

  test "should get new" do
    get new_sprint_path
    assert_response :success
  end

  test "should get show" do
    get sprints_path(sprints(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_sprint_path(sprints(:one))
    assert_response :success
  end

  test "should destroy" do
    assert_difference('Sprint.count', -1) do
      delete sprint_path(sprints(:one))
    end

    assert_redirected_to sprints_path
  end
end