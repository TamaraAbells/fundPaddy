class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :member, foreign_key: true
      t.text :message
      t.string :title
      t.integer :status
      t.integer :recipient_id

      t.timestamps
    end
  end
end
