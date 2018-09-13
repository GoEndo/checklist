require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get show" do
    get user_path(users(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path(users(:one))
    assert_response :success
  end

  test "should destroy" do
    assert_difference('User.count', -1) do
      delete user_path(users(:one))
    end

    assert_redirected_to users_path
  end
end
