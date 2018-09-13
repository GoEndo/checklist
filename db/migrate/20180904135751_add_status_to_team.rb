class AddStatusToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :status, :string
  end
end
