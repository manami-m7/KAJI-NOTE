class TaskHistory < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # def time_diff
  #   @time_diff = task_history.finish_time - task_history.start_time
  # end

end
