class AddRefererToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :referrer, :string
  end
end
