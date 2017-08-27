class AddUserNameToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :user_name
    add_column :users, :user_name, :string, unique:true
  end
end
