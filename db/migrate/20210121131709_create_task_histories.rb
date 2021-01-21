class CreateTaskHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :task_histories do |t|
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
