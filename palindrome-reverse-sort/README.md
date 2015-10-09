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
