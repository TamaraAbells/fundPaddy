class AddFullnameToMembers < ActiveRecord::Migration[5.0]
  def change
  	add_column :members, :fullname, :string
  end
end
