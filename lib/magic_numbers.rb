require 'prime'

class MagicNumbers
  attr_reader :list_of_intervals

  def initialize(list_of_intervals)
    raise ArgumentError unless valid_list_of_intervals?(list_of_intervals)

    @list_of_intervals = list_of_intervals
  end

  def compute_quantity
    list_of_intervals.sum { |interval| quantity_of_magic_numbers(interval) }
  end

  private

  def quantity_of_magic_numbers(interval)
    raise ArgumentError unless valid_interval?(interval)

    interval.first.upto(interval.last).count { |num| magic?(num) }
  end

  def magic?(num)
    prime?(Math.sqrt(num))
  end

  def prime?(num)
    return false unless natural?(num)

    Prime.prime?(num.to_i)
  end

  def natural?(num)
    num.positive? && (num % 1).zero?
  end

  def valid_list_of_intervals?(list_of_intervals)
    list_of_intervals.is_a?(Array) &&
      list_of_intervals.all? { |interval| valid_interval?(interval) }
  end

  def valid_interval?(interval)
    interval.instance_of?(Array) &&
      interval.all? { |i| i.is_a?(Integer) } &&
      interval.size == 2 &&
      interval.first <= interval.last
  end
end
