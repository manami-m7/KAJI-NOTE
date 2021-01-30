class ChartsController < ApplicationController
  def index
    # @charts_data = {}

    # TaskHistory.all.each do |t|
    #   unless @charts_data.key?(Task.find(t.task_id).task_name)
    #     @charts_data[Task.find(t.task_id).task_name] = 0
    #   end
    #   @charts_data[Task.find(t.task_id).task_name] += t.time_diff
    # end

     @charts_data = TaskHistory.joins(:task).group(:task_id)
    .pluck(Arel.sql("task_name,ROUND(SUM((strftime('%s',finish_time)-strftime('%s',start_time))/60),1)"))
    .map{ |th| {th[0]=>th[1]}}.reduce(&:merge)

  end

end
