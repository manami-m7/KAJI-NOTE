class AddTaskIdToTaskHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :task_histories, :task_id, :integer
  end
end
