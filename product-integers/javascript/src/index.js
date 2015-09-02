var multiply = (a, b) => a * b
var select_first = (a, b) => a

var make_reducer = (fn) => {
  return (prev, num, index) => {
    var [array, product] = prev
    array[index] = fn(product, array[index])
    product *= num
    return [array, product]
  }
}

var reduce_fn       = make_reducer(select_first)
var reduce_right_fn = make_reducer(multiply)

var get_products_of_all_ints_except_at_index = (int_array) => {
  var products_before_index = int_array
    .reduce(reduce_fn, [[], 1])[0]
  var products = int_array
    .reduceRight(reduce_right_fn, [products_before_index, 1])[0]
  return products
}

var main = (() => {
  var arr = [1, 7, 3, 4]
  var results = get_products_of_all_ints_except_at_index(arr)
  console.log(results)
})()
