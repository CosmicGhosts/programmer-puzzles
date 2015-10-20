require 'pp'

def merge_ranges (ranges)
  merged_ranges = []
  sorted_ranges = ranges.sort
  defaults = sorted_ranges.shift
  sorted_ranges.reduce([defaults]) do |rs, range|
    prev_range = rs.last
    next rs << range unless prev_range.last >= range.first
    rs.tap  { |arr| arr.pop }
      .push [prev_range.first, [prev_range.last, range.last].max]
  end
end

def main
  array = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
  pp merge_ranges array
end

main
