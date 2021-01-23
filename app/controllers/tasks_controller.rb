class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.group_id = current_user.group.id
    @task.save
    redirect_to home_path
  end

  def index
    @tasks = Task.where(group_id: current_user.group.id)
  end



  def edit
  end

  def update
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

   # 投稿データのストロングパラメータ
  private

  def task_params
    params.require(:task).permit(:name)
  end
end
