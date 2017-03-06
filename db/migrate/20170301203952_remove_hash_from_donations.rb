class RemoveHashFromDonations < ActiveRecord::Migration[5.0]
  def change
    remove_column :donations, :hash, :string
  end
end
