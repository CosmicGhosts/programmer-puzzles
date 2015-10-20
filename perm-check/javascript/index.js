function every (fn, array) {
  var length = array.length

  for (var i = 0; i < length; i += 1) {
    var item = array[i]
    var result = fn(item)
    if (!result) { return false }
  }

  return true
}

function perm_check (array) {
  var counts = Array(array.length + 1)
  counts[0] = 1

  array.forEach(function (n) { counts[n] = 1 })
  return every(function (x) {
    return x !== undefined
  }, counts)
}

(function main () {
  var array = [1, 1]
  var result = perm_check(array)
  console.log(result)
})()
