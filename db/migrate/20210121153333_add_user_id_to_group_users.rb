class AddUserIdToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :group_users, :user_id, :integer
  end
end
