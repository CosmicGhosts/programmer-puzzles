require! 'prelude-ls': { replicate }

perm-check = (array) ->
  counts = replicate array.length + 1, 0
  counts[0] = 1

  for n, i in array
    counts[n] = 1

  console.log counts
  counts.every (x) -> x is 1

main = do ->
  array = [1, 1]
  |> perm-check
  |> console.log
