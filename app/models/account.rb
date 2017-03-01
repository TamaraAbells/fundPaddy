class Account < ApplicationRecord
  belongs_to :member

  validates :bank_name, presence: true
  validates :acc_name, presence: true
  validates :acc_no, presence: true, length: {maximum: 15}
  validates :phone, presence: true
end

