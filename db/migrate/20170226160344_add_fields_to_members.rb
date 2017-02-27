class AddFieldsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :firstname, :string
    add_column :members, :lastname, :string
  end
end
