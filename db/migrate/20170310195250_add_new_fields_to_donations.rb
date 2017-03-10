class AddNewFieldsToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :matchtime, :datetime
    add_column :donations, :blocktime, :datetime
  end
end
