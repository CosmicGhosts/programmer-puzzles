Oh Puzzles
================

Puzzles
------------------------

## Fizz Buzz

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

## Palindrome and Reverse Lexical Sort

### The Challenge
For this challenge you will take in a text file that is given to you as a 
command line argument.  That text file will be composed of several lines of
strings.  You must take each line and determine if that line is a palindrome,
if it is, then you will print `YES`, else you will print `NO`.  Then you will 
print a `|`, then the line sorted in reverse lexical order without the white 
space characters.

Example Input:
```bash
12344321
00982343
pizza
aibohphobia
Influential Publishers
Xanax
```

Example Output:
```bash
YES | 44332211
NO | 98433200
NO | zzpia
YES | pooiihhbbaa
NO | uutssrnnllliihfeebaPI
YES | xnaaX
```

## Trading Stocks

### The Challenge
Let's start trading Apple stocks.
I have an array `stock_prices_yesterday` where:

The indices are the time in minutes past trade opening time, which was 9:30am local time.
The values are the price in dollars of Apple stock at that time.
For example, the stock cost $500 at 10:30am, so `stock_prices_yesterday[60] = 500`.

Write an efficient algorithm for computing the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).
