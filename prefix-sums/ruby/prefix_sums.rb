require 'pp'

def prefix_sums (array)
  n = array.length
  p = [0] * (n + 1)
  (1..n).each do |k|
    p[k] = p[k - 1] + array[k - 1]
  end
  p
end

def main
  array = [1, 2, 3]
  pp prefix_sums array
end

main
