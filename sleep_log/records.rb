require_relative './record'

module SleepLog
  class Records
    attr_reader :date, :times_line

    def initialize(line)
      @date, @times_line = line.split(' ', 2)
      # @date = date
      # @start_time = start_time
      # @end_time = end_time
    end

    def minutes
      records.map(&:minutes).reduce(:+)
    end

    def records
      return @records if @records
      time_ranges = *times_line.split(';').map(&:strip)
      @records = time_ranges.map { |time_range| Record.new(date, *time_range.split(' ', 2)) }
    end

    def duration
      Duration.new(records.map(&:minutes).sum).to_hours
    end
  end
end
