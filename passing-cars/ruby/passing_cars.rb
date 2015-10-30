def passing_cars (array)
  count = 0
  passed = 0
  limit = 3

  array.each do |n|
    if count >= limit
      return -1
    end

    if n == 0
      passed += 1
    else
      count += passed
    end
  end

  count
end

def main
  array = [0, 1, 0, 1, 1]
  puts passing_cars array
end

main
