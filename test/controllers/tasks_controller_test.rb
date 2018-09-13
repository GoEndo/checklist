require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_path
    assert_response :success
  end

  test "should get new" do
    get new_task_path
    assert_response :success
  end

  test "should get show" do
    get tasks_path(tasks(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_task_path(sprints(:one))
    assert_response :success
  end

  test "should destroy" do
    assert_difference('Task.count', -1) do
      delete task_path(tasks(:one))
    end

    assert_redirected_to tasks_path
  end
end
