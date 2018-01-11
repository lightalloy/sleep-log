require_relative './records'

module SleepLog
  class Parser
    attr_reader :filename

    def initialize(filename = 'sleep_log.txt')
      @filename = filename
    end

    def results
      records.each do |record|
        puts "#{record.date} - #{record.duration}"
      end
      puts '----------------'
      puts "Average sleep duration: #{Duration.new(average).to_hours}"
    end

    private

    def records
      @records ||= File.readlines(filename).reject{ |line| line.gsub('-', '').strip.empty? }.map { |line| SleepLog::Records.new(line) }
    end

    def average
      records.map(&:minutes).reduce(:+) / records.size
    end
  end
end
