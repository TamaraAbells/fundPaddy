class CreateWithdrawals < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawals do |t|
      t.string :plan
      t.integer :amount
      t.string :status
      t.references :member, foreign_key: true

      t.timestamps
    end

    add_index :withdrawals, [:member_id, :status]
  end
end
