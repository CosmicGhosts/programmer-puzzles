require 'pp'

def binary_search (target, items)
  mid = (items.length / 2) - 1
  return false      if items.empty?
  return items[mid] if items[mid] == target
  return binary_search target, items[0...mid]       if items[mid] > target
  return binary_search target, items[(mid + 1)..-1] if items[mid] < target
end

def main
  target = 3
  array  = [1, 2, 3, 4, 5, 7, 8]
  pp binary_search target, array
end

main
