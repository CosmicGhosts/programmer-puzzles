require! 'prelude-ls': { fold, slice, max, min, product, map, take, maximum, minimum, last }

copy = (array) -> take array.length, array

get-max = (i, current, highest, lowest) ->
  highest[i]
  |> max current * lowest[i - 1]
  |> max current * highest[i - 1]

get-min = (i, current, highest, lowest) ->
  lowest[i]
  |> max current * lowest[i - 1]
  |> max current * highest[i - 1]

compare-n = (base, current) ->
  { highest, lowest } = base
  upper = highest.length - 1
  range = [upper to 1 by -1]

  fold ({ highest, lowest }, index) ->
    lowest[index]  = get-min index, current, highest, lowest
    highest[index] = get-max index, current, highest, lowest
    { highest, lowest }
  , base, range

  lowest[0]  = min lowest[0], current
  highest[0] = max highest[0], current

  { highest, lowest }

product-n = (ints, n = 3) ->
  initial  = map ((i) -> product (take i, ints)), [2 to n]
  lowest   = [(minimum take (n-1), ints), ...(copy initial)]
  highest  = [(maximum take (n-1), ints), ...(copy initial)]
  new-ints = slice (n-1), ints.length, ints

  fold compare-n, { highest, lowest }, new-ints
  |> (.highest)
  |> last

main = do ->
  array = [-10, -15, 1, 3, 2]
  output = product-n array, 3
  console.log output
