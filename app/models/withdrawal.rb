class Withdrawal < ApplicationRecord

	# default_scope  { order(:created_at => :asc) }

	belongs_to :member
end
