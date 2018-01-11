gem 'minitest', '~> 5.11'
require 'minitest/autorun'
require_relative '../sleep_log/duration'

class SleepRecordTest < Minitest::Test
  def test_465_minutes
    assert_equal SleepLog::Duration.new(465).to_hours, '7:45'
  end

  def test_490_minutes
    assert_equal SleepLog::Duration.new(490).to_hours, '8:10'
  end
end
