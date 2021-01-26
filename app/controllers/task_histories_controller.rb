class TaskHistoriesController < ApplicationController
  def new
    @task = Task.new
  end

  def start
    @task_history = Task_history.new

  end

  def finish
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
