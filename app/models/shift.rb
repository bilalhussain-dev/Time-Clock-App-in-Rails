class Shift < ApplicationRecord
  has_many :shift_assignments
  has_many :users, through: :shift_assignments

  validates :title, presence: true
  validates :description, presence: true
end
