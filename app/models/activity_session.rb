class ActivitySession < ApplicationRecord
  validates :uuid, :date, presence: true, uniqueness: true
  validates :active_time, :calories, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :sleep_session
end
