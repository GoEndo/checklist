class AddRankToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :rank, :integer
  end
end
