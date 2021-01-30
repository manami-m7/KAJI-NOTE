module ApplicationHelper
  def simple_time(time)
    time.strftime('%H:%M')
  end

  def simple_day(day)
    day.strftime('%m/%d')
  end

end
