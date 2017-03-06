class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :hash
      t.integer :amount
      t.string :plan
      t.references :member, foreign_key: true
      t.text :comment

      t.timestamps
    end

    add_index :donations, [:member_id, :plan]
  end
end
