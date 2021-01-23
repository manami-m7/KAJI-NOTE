class HomesController < ApplicationController
  def top
  end

  def how
  end

  def index
   @tasks = Task.where(group_id: current_user.group.id)
  end
end
