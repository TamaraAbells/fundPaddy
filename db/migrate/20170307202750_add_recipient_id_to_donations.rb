class AddRecipientIdToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :recipient_id, :integer
  end
end
