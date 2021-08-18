class Topic < ApplicationRecord
    has_many :recordings, dependent: :destroy

    validates :name, presence: true

    def total_time
        self.recordings.map{|recording| recording.ends_at - recording.starts_at}.inject(0){|a,b| a+b}
    end

    def total_time_to_s
        Time.at(self.total_time).utc.strftime("%H:%M:%S")
    end
end
