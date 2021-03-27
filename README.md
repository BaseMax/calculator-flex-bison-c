# calculator-flex-bison-c

A tiny calculator project with lexer/parser based on Flex, Bison with pure c programming language.

## Syntax

```python
print 5;
print 100+10;
a = 50;
print a;
print a+a;
print a+100;
```

## Compile

Easily run `bash build.sh`.

or do manually:

```bash
$ flex myscanner.l
$ yacc -d parser.y
$ gcc y.tab.c lex.yy.c
or
$ cc y.tab.c lex.yy.c
```

## Using

run `./a.out` and type `print 10;` or etc...

Or Run parser and get contents from `input.in` file via linux/unix command:

```bash
$ ./a.out  < input.in
Print 5
Print 110
Print 50
Print 100
Print 150
```

Feel free to participate and develop.

### Similar repositories

- https://github.com/BaseMax/config-parser-flex

### Acknowledgment

I saw an lecture from Prof. Jonathan Engelsma and It's encouraged me to do this project myself.

© Copyright Max Base
