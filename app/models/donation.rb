class Donation < ApplicationRecord
  belongs_to :member

  validates :amount, presence: true
  validates :plan, presence: true
end
