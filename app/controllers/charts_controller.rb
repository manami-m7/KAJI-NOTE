class ChartsController < ApplicationController
  def index
    @charts_data = {}
    @charts_length = {}
    @charts_average = {}
    task_histories = TaskHistory.where(user_id: current_user.id)
    task_histories.each do |t|
      unless @charts_data.key?(Task.find(t.task_id).task_name)
        @charts_data[Task.find(t.task_id).task_name] = 0
        @charts_length[Task.find(t.task_id).task_name] = 0
      end
      @charts_data[Task.find(t.task_id).task_name] += t.time_diff
      @charts_length[Task.find(t.task_id).task_name] += 1
      @charts_average[Task.find(t.task_id).task_name] = @charts_data[Task.find(t.task_id).task_name] / @charts_length[Task.find(t.task_id).task_name]
    end
  end
end





