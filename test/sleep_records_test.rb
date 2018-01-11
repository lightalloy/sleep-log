gem 'minitest', '~> 5.11'
require 'minitest/autorun'
require_relative '../sleep_log/records'

class SleepRecordsTest < Minitest::Test
  def test_date_parsing
    assert_equal SleepLog::Records.new('10.01 23:00 6:45').date, '10.01'
  end

  def test_minutes
    assert_equal SleepLog::Records.new('15.03 00:01 6:45; 9:20 10:10').minutes, 454
  end

  def test_the_single_record_with_different_dates
    assert_equal SleepLog::Records.new('10.01 23:00 6:45').duration, '7:45'
  end

  def test_the_single_record_with_the_same_date
    assert_equal SleepLog::Records.new('01.12 00:25 5:50').duration, '5:25'
  end

  def test_multiple_records_with_the_same_date
    assert_equal SleepLog::Records.new('15.03 00:01 6:45; 9:20 10:10').duration, '7:34' # 6:44 + 50
  end

  def test_multiple_records_with_different_dates
    assert_equal SleepLog::Records.new('15.03 23:37 3:00; 3:30 7:10').duration, '7:03' # 3:23 + 3:40
  end

  def test_three_records
    assert_equal SleepLog::Records.new('24.07 23:59 2:30; 3:20 6:45; 9:30 11:00').duration, '7:26' # 2:31 + 3:25 + 1:30
  end
end
