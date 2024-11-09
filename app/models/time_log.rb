class TimeLog < ApplicationRecord
  belongs_to :shift_assignment
  belongs_to :user

  validates :check_in, presence: true
  validate :check_out_after_check_in

  def duration
    return 0 unless check_in
    end_time = check_out || Time.current
    ((end_time - check_in) / 1.hour).round(2)
  end

  private

  def check_out_after_check_in
    return unless check_in && check_out
    if check_out < check_in
      errors.add(:check_out, "must be after check-in time")
    end
  end
end