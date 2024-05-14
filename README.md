# bash

## Summary
```bash
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
```
<br>
Displays the top 10 most used bash terminal commands

```bash
whatis <program>
```
<br>
Displays program info

```bash
which <program>
```
<br>
Displays a place where you can find the program

```bash
whereis <program>
```
<br>
Displays ALL places where you can find the program

```bash
less
```
<br>
Read a file 1 page at a time

```bash
grep
```
<br>
Displays line

```bash
awk
```
<br>
Displays specific word/words

```bash
ps -aux | grep <program>
```
<br>
Locate specific process

```bash
kill -9 <pid>
```
<br>
Kill specific process

```bash
pkill -f <process>
```
Kill specific process

