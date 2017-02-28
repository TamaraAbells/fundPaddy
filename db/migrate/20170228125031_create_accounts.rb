class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :member, foreign_key: true
      t.string :bank_name
      t.string :acc_no
      t.string :acc_name
      t.string :bitcoin_address
      t.string :phone

      t.timestamps
    end
  end
end
