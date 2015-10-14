require! 'prelude-ls': { replicate, max }

reduce = (fn, defaults, array) -> array.reduce fn, defaults

find-duration = (acc, position, seconds) ->
  { duration, river, total } = acc
  return acc unless river[position] is 0
  river: river[position] = 1 and river
  total: total -= position
  duration: max seconds, duration

wait-for-leafs = (timeline, pos) ->
  defaults =
    river: replicate (pos + 1), 0
    total: pos * (pos + 1) / 2
    duration: 0

  reduce find-duration, defaults, timeline
  |> ({ duration, total }) ->
    if total is 0
    then duration
    else -1

main = do ->
  array = [1, 3, 1, 4, 2, 3, 5, 4]
  |> wait-for-leafs _, 5
  |> console.log
