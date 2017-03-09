class Withdrawal < ApplicationRecord

	# default_scope  { order(:created_at => :asc) }

	scope :unmatched, -> { where(status: 'waiting') }
	
	belongs_to :member
end
