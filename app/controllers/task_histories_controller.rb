class TaskHistoriesController < ApplicationController

protect_from_forgery :except => [:start]

  def new
    @task_id = params[:task_id]
    @task_history = TaskHistory.new
  end

  def start
    @task_history = TaskHistory.new
    @task_history.task_id = params[:task_id]
    @task_history.start_time = Time.now
    @task_history.user_id = current_user.id
    @task_history.save
    render new_task_history_path

  end

  def finish
    @task_history_id = TaskHistory.where(finish_time: nil)
    @task_history = TaskHistory.find(params[:task_history_id])
    @task_history.finish_time = Time.now
    @task_history.save
    redirect_to task_histories
  end

  def index
    @task_histories = TaskHistory.where(user_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
