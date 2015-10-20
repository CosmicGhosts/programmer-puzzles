function replicate (val, n) {
  var array = []
  for (var i = 0; i < n; i += 1) {
    array[i] = val
  }
  return array
}

function max_counters (n, array) {
  var max = 0
  var counters = replicate(0, n)
  var length = array.length

  for (var i = 0; i < length; i += 1) {
    var val = array[i]

    if (1 <= val && val <= n) {
      var count = counters[val - 1] + 1
      counters[val - 1] = count
      max = Math.max(max, count)
    }

    if (val === (n + 1)) {
      counters = replicate(max, n)
    }
  }

  return counters
}

(function main () {
  var array = [3, 4, 4, 6, 1, 4, 4]
  var result = max_counters(5, array)
  console.log(result)
})()
