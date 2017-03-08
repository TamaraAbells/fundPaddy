class AddDonationIdToWithdrawals < ActiveRecord::Migration[5.0]
  def change
    add_column :withdrawals, :donation_id, :integer
  end
end
