# Testrus

Aids in testing your programs in informatics competitions.

Install it with `gem install testrus`.

## Usage

`testrus` looks for input and output file pairs in the directory you run it
from. E.g. if:

```bash
$ ls
input.1
input.2
output.1
output.2
```

You have two tests. The expected output is in the output file. Then simply run
testrus from this directory with the path to the script you would like to test.

![](http://i.imgur.com/kvhnt.png)
![](http://i.imgur.com/9lFil.png)

If the time exceeds a second or the memory usage comes above 64mb the test will
also appear failed.
