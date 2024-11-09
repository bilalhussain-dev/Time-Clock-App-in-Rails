class ShiftAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :shift
  has_many :time_logs

  validates :user_id, presence: true
  validates :shift_id, presence: true
end