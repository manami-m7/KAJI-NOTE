class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    # current_user.groups[0].id
    @task = Task.new(task_params)
    @task.grou_id = current_user.groups[0].id
    @task.save
    redirect_to home_path
  end

  def index
    #current_user.groups ログイン中のユーザーが所属するグループのグループテーブル
    #mapメソッドで
    @tasks = Task.where(group_id: current_user.groups[0].id) map{|group| group.id})
    # [Group1, Group2, Group3]
    # [1, 2, 3]
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
