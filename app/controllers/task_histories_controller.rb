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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
