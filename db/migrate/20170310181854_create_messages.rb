class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :title
      t.integer :status
      t.integer :recipient_id

      t.timestamps
    end
  end
end
