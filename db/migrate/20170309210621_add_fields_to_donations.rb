class AddFieldsToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :payment_text, :string
    add_column :donations, :pop, :string
  end
end
