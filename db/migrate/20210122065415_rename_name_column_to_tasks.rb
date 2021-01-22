class RenameNameColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :name, :task_name
  end
end
