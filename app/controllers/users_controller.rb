class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
    #@users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    #redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      if User.where(role: 'admin', activated: true).empty?
        @user.activate
        log_in @user
        flash[:success] = "Welcome to the MnR Check-list"
        redirect_to root_path
      else
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    #redirect_to users_path
    if !@user.errors.empty?
      redirect_to users_path, danger: "An Error Occurred! #{@user.errors[:base]}"
    else
      redirect_to users_path
    end

  end

  private

  def user_params
    if current_user&.admin?
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :role)
    else
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(users_path) unless current_user?(@user) || current_user.admin?
  end
end
