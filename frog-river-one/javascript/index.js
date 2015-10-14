const max = Math.max

function find_duration (acc, position, seconds) {
  var river = acc.river
  var total = acc.total
  var duration = acc.duration

  if (river[position] !== undefined) {
    return acc
  }

  river[position] = 1
  total -= position

  return {
    river: river,
    total: total,
    duration: max(seconds, duration)
  }
}

function wait_for_leafs (timeline, pos) {
  var defaults = {
    river: [],
    total: (pos * (pos + 1) / 2),
    duration: 0
  }

  var data = timeline.reduce(find_duration, defaults)
  if (data.total !== 0) return -1 
  return data.duration
}

(function main () {
  var array = [1, 3, 1, 4, 2, 3, 5, 4]
  var result = wait_for_leafs(array, 5)
  console.log(result)
})()
