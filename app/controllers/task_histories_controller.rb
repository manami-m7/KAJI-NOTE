class TaskHistoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  skip_before_action :require_time_keep, only: [:new, :finish]

  protect_from_forgery :except => [:start]
  require "date"

  def new
    @task = current_user.tasks.find(params[:task_id])
    @task_history = current_user.task_histories.find_by(finish_time: nil)
  end

  def start
    @task_history = TaskHistory.new
    @task_history.task_id = params[:task_id]
    @task_history.start_time = DateTime.now
    @task_history.user_id = current_user.id
    @task_history.save
     @task = Task.find(params[:task_id])
    render :new
  end

  def finish
    @task_history = TaskHistory.where(user_id: current_user.id).find(params[:task_history_id])
    @task_history.finish_time = DateTime.now
    @task_history.save
    redirect_to task_histories_path
  end

  def index
    @task_histories = TaskHistory.where(user_id: current_user.id).order(created_at: "DESC")
    @task_histories_today = TaskHistory.where(user_id: current_user.id).where("created_at >= ?", Date.today)
    @task_time = 0
    @task_histories_today.each do |task_history|
      @task_time = @task_time + task_history.time_diff
      p @task_time
    end
  end

  def edit
    @task_history = TaskHistory.where(user_id: current_user.id).find(params[:id])
  end

  def update
    @task_history = TaskHistory.where(user_id: current_user.id).find(params[:id])
    if @task_history.update(task_history_params)
      redirect_to task_histories_path
    else
      render :edit
    end
  end

  def destroy
    @task_history = TaskHistory.where(user_id: current_user.id).find(params[:id])
    @task_history.destroy
    redirect_to task_histories_path
  end

  private

  def task_history_params
    params.require(:task_history).permit(:start_time, :finish_time)
  end

  def ensure_correct_user
    @task_history = TaskHistory.find(params[:id])
    unless @task_history.user_id == current_user.id
      redirect_to root_path
    end
  end
end
