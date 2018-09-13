class AddEndToSprint < ActiveRecord::Migration[5.2]
  def change
    add_column :sprints, :end, :date
  end
end
