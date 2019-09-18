Here are some small problems with repl:
1. When error occurs in the repl, it will never disappear.
```
>>> s = 2
.vrepl_temp.v:2:1: undefined: `s`
>>> 2
.vrepl_temp.v:2:1: undefined: `s`
```
Add two elements `cur_line` and `cur_func` to help recover from the error condition, when error occured, the lines should be removed.

2. `exit`, `help` command works in function.
```
>>> fn h() {
... exit  // it will exit the repl   
```
Move the function checker to the front of command checker, so command won't work in function.

3. simple expression
```
>>> 1+2  // this one print
3
>>> 1 + 2 // this one with whitespace won't print
```
Remove the whitespace checker to make both ok.