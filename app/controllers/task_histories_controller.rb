class TaskHistoriesController < ApplicationController

protect_from_forgery :except => [:start]
require "date"

  def new
    @task_id = params[:task_id]
    @task_history = current_user.task_histories.find_by(finish_time: nil)
    # @task_history_id = TaskHistory.where(finish_time: nil, user_id: current_user.id)
    render :new
  end

  def start
    @task_history = TaskHistory.new
    @task_history.task_id = params[:task_id]
    @task_history.start_time = DateTime.now
    @task_history.user_id = current_user.id
    @task_history.save
    render :new
  end

  def finish
    @task_history = TaskHistory.find(params[:task_history_id])
    @task_history.finish_time = DateTime.now
    @task_history.save
    redirect_to task_histories_path
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
