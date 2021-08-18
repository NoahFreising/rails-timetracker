class Recording < ApplicationRecord
  belongs_to :topic

  def recorded_time
    self.ends_at - self.starts_at
  end

  def recorded_time_to_s
    Time.at(self.recorded_time).utc.strftime("%H:%M:%S")
  end

  def recorded_time_to_t
    Time.at(self.recorded_time).utc
  end
end
