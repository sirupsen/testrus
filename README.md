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

You have two tests. The expected output is in the output file. To test your
program, simply run testrus from this directory with the command to run your
program, then the test data will be piped to your program via STDIN.

If the runtime exceeds a second or the memory usage ever exceeds 64mb the test will
also appear failed.

## Screenshots

![](http://i.imgur.com/kvhnt.png)
![](http://i.imgur.com/9lFil.png)
![](http://i.imgur.com/mWLDj.png)
