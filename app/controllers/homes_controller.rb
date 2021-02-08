class HomesController < ApplicationController
  def top
  end

  def how
  end

  def index
   @tasks = Task.where(user_id: current_user.id)
  end
end
