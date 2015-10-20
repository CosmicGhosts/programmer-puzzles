function missing_integer (array) {
  var length = array.length
  var counts = []
  counts.length = length

  for (var i = 0; i < length; i += 1) {
    if (1 <= array[i] <= length + 1) {
      counts[array[i]] = true
    }
  }

  for (var j = 0; j < length + 1; i += 1) {
    if (counts[j] === undefined) {
      return index + 1
    }
  }

  return -1
}
