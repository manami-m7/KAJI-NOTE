class AddUserIdToTaskHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :task_histories, :user_id, :integer
  end
end
