module SleepLog
  Duration = Struct.new(:minutes) do
    def to_hours
      hours = minutes / 60
      mins = minutes % 60
      mins = "0#{mins}" if mins < 10
      "#{hours}:#{mins}"
    end
  end
end
