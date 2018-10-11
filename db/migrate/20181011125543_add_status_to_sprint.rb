class AddStatusToSprint < ActiveRecord::Migration[5.2]
  def change
    add_column :sprints, :status, :string
  end
end
