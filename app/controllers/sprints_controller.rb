class SprintsController < ApplicationController
  def index
    @sprints = Sprint.all
  end

  def new
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new(sprint_params)

    if @sprint.save
      redirect_to sprints_path
    else
      render 'new'
    end
  end

  def edit
    @sprint = Sprint.find(params[:id])
  end

  def update
    @sprint = Sprint.find(params[:id])

    if @sprint.update(sprint_params)
      redirect_to sprints_path
    else
      render 'edit'
    end
  end

  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy

    redirect_to sprints_path
  end

  private

  def sprint_params
    params.require(:sprint).permit(:name, :start, :duration)
  end
end
