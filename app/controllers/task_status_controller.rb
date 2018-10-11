class TaskStatusController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def edit
    @team = Team.find(params[:team_id])
    @taskstatus = TaskStatus.find(params[:id])
    @task = Task.find(@taskstatus.task_id)
    @sprint = Sprint.find(@taskstatus.sprint_id)
  end

  def update
    @taskstatus = TaskStatus.find(params[:id])

    if @taskstatus.update(taskstatus_params)
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  private

  def taskstatus_params
    params.require(:task_status).permit(:status)
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
end
