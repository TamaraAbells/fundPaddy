class AddPayStatusToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :pay_status, :string, default: 'unpaid'
  end
end
