"use strict";

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"]) _i["return"](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError("Invalid attempt to destructure non-iterable instance"); } }; })();

var multiply = function multiply(a, b) {
  return a * b;
};
var select_first = function select_first(a, b) {
  return a;
};

var make_reducer = function make_reducer(fn) {
  return function (prev, num, index) {
    var _prev = _slicedToArray(prev, 2);

    var array = _prev[0];
    var product = _prev[1];

    array[index] = fn(product, array[index]);
    product *= num;
    return [array, product];
  };
};

var int_array_reducer = make_reducer(select_first);
var int_array_reducer_right = make_reducer(multiply);

var get_products_of_all_ints_except_at_index = function get_products_of_all_ints_except_at_index(int_array) {
  var products_before_index = int_array.reduce(int_array_reducer, [[], 1])[0];
  var products = int_array.reduceRight(int_array_reducer_right, [products_before_index, 1])[0];
  return products;
};

var arr = [1, 7, 3, 4];
console.log(get_products_of_all_ints_except_at_index(arr));