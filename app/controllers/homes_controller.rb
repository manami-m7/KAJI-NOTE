class HomesController < ApplicationController
  def top
  end

  def how
  end

  def index
    @tasks = Task.all
  end
end
