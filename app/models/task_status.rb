class TaskStatus < ApplicationRecord
  has_one :team
  has_one :sprint
  has_one :task

  def self.task_status(team, sprint, task)
    @taskstatuses = TaskStatus.where( "team_id = ? AND sprint_id = ? AND task_id = ?", team.id, sprint.id , task.id )
  end

  def self.new_task_status(team, sprint, task)
    @taskstatuses = TaskStatus.create(team_id: team.id, sprint_id: sprint.id, task_id:task.id, status: "Incomplete")
  end
end
