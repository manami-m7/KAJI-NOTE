class ChartsController < ApplicationController
  def index
    # @charts_data = {}

    # TaskHistory.all.each do |t|
    #   unless @charts_data.key?(Task.find(t.task_id).task_name)
    #     @charts_data[Task.find(t.task_id).task_name] = 0
    #   end
    #   @charts_data[Task.find(t.task_id).task_name] += t.time_diff
    # end
    if Rails.env.production?
      # finishtime, starttime
      @charts_data = TaskHistory.where(user_id: current_user.id).joins(:task).group(:task_id)
    .pluck(Arel.sql("task_name,ROUND(SUM(time_to_sec(TIMEDIFF(start_time, finish_time))))"))
    .map{ |th| {th[0]=>th[1]}}.reduce(&:merge)

    @charts_average = TaskHistory.where(user_id: current_user.id).joins(:task).group(:task_id)
    .pluck(Arel.sql("task_name,ROUND(AVG(time_to_sec(TIMEDIFF(start_time, finish_time))))"))
    .map{ |th| {th[0]=>th[1]}}.reduce(&:merge)
    else
      @charts_data = TaskHistory.where(user_id: current_user.id).joins(:task).group(:task_id)
    .pluck(Arel.sql("task_name,ROUND(SUM((strftime('%s',finish_time)-strftime('%s',start_time))/60),1)"))
    .map{ |th| {th[0]=>th[1]}}.reduce(&:merge)

    @charts_average = TaskHistory.where(user_id: current_user.id).joins(:task).group(:task_id)
    .pluck(Arel.sql("task_name,ROUND(AVG((strftime('%s',finish_time)-strftime('%s',start_time))/60),1)"))
    .map{ |th| {th[0]=>th[1]}}.reduce(&:merge)
    end

  end

end
