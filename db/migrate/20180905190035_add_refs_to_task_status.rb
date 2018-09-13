class AddRefsToTaskStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :task_statuses, :team, foreign_key: true
    add_reference :task_statuses, :sprint, foreign_key: true
    add_reference :task_statuses, :task, foreign_key: true
  end
end
