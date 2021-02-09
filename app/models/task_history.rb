class TaskHistory < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # 小数点四捨五入
  def time_diff
    return ((self.finish_time - self.start_time) / 60).round
  end

  validate :time_validate


  private

  def time_validate
    if (start_time.present? && finish_time.present?) && start_time > finish_time
      errors.add(:start_time, "The Start Time is later than the Finish Time")
    end
  end
end
