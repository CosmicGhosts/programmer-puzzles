### The Challenge
You will write a script that reads 3 command line arguments:

1. ***first divisor*** - This is the first divisor you will check against the 
													dividend.
2. ***second divisor*** - This is the second divisor you will check against the 
													dividend.
3. ***upper bound*** - This is the maximum dividend.

You script will cycle through the range of `[0..<upper bound>]` and print one of the following strings:

* If divisible by both the `first divisor` and `second divisor` print `FizzBuzz`
* If divisible by just the `first divisor` then print `Fizz`
* If divisible by just the `second divisor` then print `Buzz`
* If not divisible by either divisor then print the dividend itself.

Here is some the sample output for the arguments `2 4 6`:

```bash
1
Fizz
3
FizzBuzz
5
Fizz
```
