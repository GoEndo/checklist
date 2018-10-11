class TeamsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]

  def index
    @teams = Team.all
    @sprints = Sprint.where( 'start <= :today AND "end" >= :today', {today: Time.now})
    @tasks = Task.all
    @statuses = Status.all
    @all_sprints = Sprint.all

    @all_sprints.each do |sprint|
      days_left = (sprint.end.to_date - Date.today).to_i
      status = 'Green'
      @teams.each do |team|
        case
        when days_left < 1
          status = 'Red'
        when  (2..3).include?(days_left)
          status = 'Yellow'
        else
          next
        end

        s = 'Green'
        @tasks.each do |task|
          task_statuses = TaskStatus.task_status(team, sprint, task)
          task_statuses.each do |tasks_tatus|
            if tasks_tatus.status.casecmp('Incomplete').zero?
              s = status
            end
          end
        end
        status = s

        current_status = @statuses.detect { |i| i.team_id == team.id && i.sprint_id == sprint.id }
        current_status ||= Status.new_status(team, sprint)
        current_status.name = status
        current_status.save
      end
    end

  end

  def show
    @team = Team.find(params[:id])
    @sprints = Sprint.where( 'start <= :today AND "end" >= :today', {today: Time.now})
    @allsprints = Sprint.reorder("start DESC").paginate(page: params[:page])
    @tasks = Task.all
    @statuses = Status.where( team_id: @team.id)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name)
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
