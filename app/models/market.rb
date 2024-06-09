class Market < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validate :end_after_start

  private

  def end_after_start
    return unless end_date_time <= start_date_time

    errors.add(:end_date_time, 'must be after the start time')
  end
end
