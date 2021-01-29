class ChangeDataFinishTimeToTaskHistories < ActiveRecord::Migration[5.2]
  def up
    change_table :task_histories do |t|
      t.change :finish_time, :datetime
    end
  end

  def down
    change_table :task_histories do |t|
      t.change :finish_time, :time
    end
  end
end
