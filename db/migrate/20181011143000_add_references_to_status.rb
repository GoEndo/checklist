class AddReferencesToStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :statuses, :team, foreign_key: true
    add_reference :statuses, :sprint, foreign_key: true
  end
end
