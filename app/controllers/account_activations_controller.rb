class AccountActivationsController < ApplicationController
  before_action :logged_in_user_admin, only: [:edit]

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      #log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  private

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user_admin
    unless logged_in? and admin?
      store_location
      flash[:danger] = "Please log in as admin."
      redirect_to login_path
    end
  end

end
