gem 'minitest', '~> 5.11'
require 'minitest/autorun'
require_relative '../sleep_log/record'

class SleepRecordTest < Minitest::Test
  def test_different_dates
    assert_equal SleepLog::Record.new('10.01', '23:00', '6:45').minutes, 465
  end

  def test_same_dates
    assert_equal SleepLog::Record.new('24.05', '00:20', '8:30').minutes, 490
  end
end
