class Donation < ApplicationRecord

  scope :unmatched, -> { where(status: 'waiting', recipient_id: nil) }
	
  belongs_to :member

  validates :amount, presence: true
  validates :plan, presence: true
end
