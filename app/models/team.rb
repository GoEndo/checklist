class Team < ApplicationRecord
  has_many :task_statuses
  validates :name, presence: true,
            length: { minimum: 5 }
end
