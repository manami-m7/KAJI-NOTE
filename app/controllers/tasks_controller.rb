class TasksController < ApplicationController

  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to home_path
    else
      render :new
    end
  end

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def edit
    @task = Task.where(user_id: current_user.id).find(params[:id])
  end

  def update
    @task = Task.where(user_id: current_user.id).find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.where(user_id: current_userid).find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

   # 投稿データのストロングパラメータ
  private

  def task_params
    params.require(:task).permit(:task_name)
  end
end
