module SleepLog
  class Record
    attr_reader :start_time, :end_time, :date
    def initialize(date, start_time, end_time)
      @date = date
      @start_time = start_time
      @end_time = end_time
    end

    def start
      return @start if @start
      @start = DateTime.parse("#{date}.#{Date.today.year} #{start_time}")
      @start = @start - 1 if @start > finish
      @start
    end

    def finish
      @finish ||= DateTime.parse("#{date}.#{Date.today.year} #{end_time}")
    end

    def minutes
      ((finish - start) * 24 * 60).to_i
    end

    def duration
      Duration.new(minutes).to_hours
    end
  end
end
