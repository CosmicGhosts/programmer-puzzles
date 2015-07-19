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

var int_array_reducer       = make_reducer(select_first)
var int_array_reducer_right = make_reducer(multiply)

var get_products_of_all_ints_except_at_index = (int_array) => {
  var products_before_index = int_array
    .reduce(int_array_reducer, [[], 1])[0]
  var products = int_array
    .reduceRight(int_array_reducer_right, [products_before_index, 1])[0]
  return products
}

var arr = [1, 7, 3, 4]
console.log(get_products_of_all_ints_except_at_index(arr))
