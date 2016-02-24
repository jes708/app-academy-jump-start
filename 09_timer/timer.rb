class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    h = seconds / 3600
    m = (seconds % 3600) / 60
    s = seconds % 60
    time_array = [h, m, s].map do |time|
      time_string = time.to_s
      time_string = "0" + time_string if time_string.length == 1 
      time_string
    end
    time_array.join(":")
  end

end