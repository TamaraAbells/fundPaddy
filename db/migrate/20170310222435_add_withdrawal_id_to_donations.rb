class AddWithdrawalIdToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :withdrawal_id, :integer
  end
end
