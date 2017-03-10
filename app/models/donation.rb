class Donation < ApplicationRecord

  default_scope { order(:created_at => 'asc')}

  scope :unmatched, -> { where(status: 'waiting', recipient_id: nil) }
  scope :matched, -> {where(status: 'matched')}
	
  belongs_to :member

  validates :amount, presence: true
  validates :plan, presence: true
end
