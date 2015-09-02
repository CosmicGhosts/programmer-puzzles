(ns fizzbuzz.core
  (:gen-class)
  (:use clojure.pprint))

(defn is-divisible [divisor n]
  (zero? (mod n divisor)))

(defn fizzbuzz [div-a div-b n]
  (def by-a  (is-divisible div-a n))
  (def by-b  (is-divisible div-b n))
  (def by-ab (and by-a by-b))

  (cond
    by-ab "FizzBuzz"
    by-a  "Fizz"
    by-b  "Buzz"
    :else n))

(defn -main
  "The Main FizzBuzz function"
  [& args]
  (let [[div-a div-b n] args]
    (def output (map (partial fizzbuzz (Integer. div-a) (Integer. div-b)) (range 1 (Integer. n))))
    (pprint output)
    ))
