class CreateSprints < ActiveRecord::Migration[5.2]
  def change
    create_table :sprints do |t|
      t.string :name
      t.date :start
      t.integer :duration

      t.timestamps
    end
  end
end
