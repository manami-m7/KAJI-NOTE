class TaskHistoriesController < ApplicationController
  def new
    @task_history = TaskHistory.new
  end

  def start
    @task_history = TaskHistory.new
    @task_history.start_time = Time.now
    @task_history.save

  end

  def finish
    @task_history = TaskHistory.find(params[:id])
    @task_history.finish_time = Time.now
    @task_history.save
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
