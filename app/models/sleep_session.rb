class SleepSession < ApplicationRecord
  MINIMUM_SLEEP_DURATION = 4

  validates :uuid, :date, presence: true, uniqueness: true
  validates :went_to_bed, :woke_up, presence: true
  validates :sleep_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :time_in_bed, numericality: { greater_than: 0 }
  validates :movements_per_hour, numericality: { greater_than_or_equal_to: 0 }

  validate :sleep_duration

  belongs_to :user

  private

  def sleep_duration
    message = "at least #{MINIMUM_SLEEP_DURATION} hours of sleep are required"
    errors.add :time_in_bed, message if time_in_bed.to_i < MINIMUM_SLEEP_DURATION * 3600
  end
end
