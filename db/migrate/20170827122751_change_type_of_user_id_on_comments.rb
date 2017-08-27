class ChangeTypeOfUserIdOnComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user_id
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end
