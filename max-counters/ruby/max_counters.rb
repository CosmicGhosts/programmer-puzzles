require 'pp'

def max_counters (n, array)
  max_count = 0
  current_count = 0
  counters = [0] * n

  array.each do |num|
    if num == (n + 1)
      max_count = current_count
      next
    end

    counters[num - 1] = [max_count,     counters[num - 1]].max + 1
    current_count     = [current_count, counters[num - 1]].max
  end

  (0...n).each do |index|
    counters[index] = [max_count, counters[index]].max
  end

  counters
end

def main
  array = [3, 4, 4, 6, 1, 4, 4]
  pp max_counters 5, array
end

main
