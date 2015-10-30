def count_div (a, b, k)
  if a % k == 0
    ((b - a) / k) + 1
  else
    (b / k - ((a / k) + 1)) + 1
  end
end

def count_div2 (a, b, k)
  (a..b).reduce(0) do |count, num|
    count += 1 if num % k == 0
    count
  end
end

def main
  puts count_div 10, 20, 3
  puts count_div2 10, 20, 3
end

main
