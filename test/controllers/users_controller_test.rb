require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get index when logged in" do
    log_in_as(@user)
    get users_path
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end

  test "should edit result in redirect when not logged in" do
    get edit_user_path(@user)
    assert_response :redirect
  end

  test "should get edit when logged in" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_response :success
  end

  test "should destroy" do
    assert_difference('User.count', -1) do
      delete user_path(@other_user)
    end

    assert_redirected_to users_path
  end

  test "should not destroy the last admin" do
    assert_difference('User.count', 0) do
      delete user_path(@user)
    end

    assert_redirected_to users_path
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to users_path
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to users_path
  end

  test "should allow edit when logged in as admin user" do
    log_in_as(@user)
    get edit_user_path(@other_user)
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {user: { password: 'password',
                                                   password_confirmation: 'password',
                                                   role: "admin" } }
    assert_not @other_user.reload.admin?
  end

  test "should allow the admin attribute to be edited via the web when logged in as admin" do
    log_in_as(@user)
    assert @user.admin?
    patch user_path(@user), params: {user: { password: 'password',
                                                   password_confirmation: 'password',
                                                   role: "admin" } }
    assert @user.reload.admin?
  end

end
