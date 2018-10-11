class Status < ApplicationRecord
  has_one :team
  has_one :sprint

  def self.new_status(team, sprint)
    @statuses = Status.create(team_id: team.id, sprint_id: sprint.id, name: "Unknown")
  end
end
