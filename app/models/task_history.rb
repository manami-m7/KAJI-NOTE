class TaskHistory < ApplicationRecord
  belongs_to :task
  belongs_to :user



  # 小数点四捨五入
  def time_diff
    return ((self.finish_time - self.start_time) / 60).round
  end

end
