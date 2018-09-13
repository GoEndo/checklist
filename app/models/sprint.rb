class Sprint < ApplicationRecord
  has_many :task_statuses

  validates :name, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 7  }

  before_save :set_end_date
  before_update :set_end_date

  private

  def set_end_date
    self.end = start + duration - 1
  end
end
