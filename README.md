# bash

## Summary
```bash
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
```
Displays the top 10 most used bash terminal commands

```bash
whatis <program>
```
Displays program info

```bash
which <program>
```
Displays a place where you can find the program

```bash
whereis <program>
```
Displays ALL places where you can find the program

```bash
less
```
Scrollable human readable viewer

```bash
more
```
Same as less but can only move forward, not backward

```bash
grep
```
Displays line, pattern matching

```bash
awk
```
Displays specific word/words, column specific

```bash
ps -aux | grep <program>
```
Locate specific process

```bash
kill -9 <pid>
```
Kill specific process

```bash
pkill -f <process>
```
Kill specific process

```bash
ls
ls -latrh
ls .config
```
Lists the contents of the target directory

```bash
cd
```
Change Directory

```bash
pwd
```
Print working directory

```bash
echo
```
Prints text

```bash
cat 
```
Displays contents of file

```bash
touch
```
Create a file

```bash
cp
```
Copy file/directory to target destination

```bash
mv
```
Move file/directory to target destination

```bash
rm
rm -r
rm -rf
```
Deletes file
<br>
Deletes directory
<br>
Deletes files recursively and forcefully

```bash
ln
ln -s <file <file>
```
Create a symbolic link to a file in a different location

```bash
ls --help
```
Help page

```bash
man
```
Manual page for a specific command

```bash
find
find * -name "*<file*>"
```
Find files or directories

```bash
sed
sed 's/PLACEHOLDER EMAIL TEXT/acualemail@gmail.com/' <file>
```
Find and replace text (similar to vims find and replace)

```bash
sort
sort -nr
```
Sorts text contents, default is alphabetic
<br>
Sorts text contents in numerical, reverse order

```bash
head
head -n
```
Displays first 12 lines of a file

```bash
tail
tail -f
```
Displays the last 12 lines of a file
<br>
Display the last 12 lines but FOLLOWS as new lines are added, used by devs for logs

```bash
|
```
Passes the stdout of the old command to the stdin of the new command

```bash
xargs
ls | xargs du -sh
ls | grep 'l' | xargs du -sh
```
Takes the content and splits it into chunks then passes it into an argument to what command you specify

```bash
$(<command>)
echo "My current directory is: $(pwd)"
```
Subshell

```bash
ls --help > ls-help.txt
```
Overwrites over the file
<br>
Stdout can be sent to a file output

```bash
ls --help >> ls-help.txt
```
>> appends to end of file

```bash
fzf
```
Fuzzy finder

```bash
compgen -c | fzf | xargs man
```
Find a command, then read it's related man page

```bash
alias <aliasname>="<command>"
```
Stdout can be sent to a file output
<br>
Can be placed into zshrc or bashrc, available every session

```bash
du -ah . | sort -hr | head -n 10
```
Find the biggest files/directories

```bash
!!
```
Returns previous command

```bash
ping -c 1 "github.com" | grep time && echo "it's alive"
```
Conditional response, if the pin is successful and if grep sees "time", then the terminal returns the word "it's alive"
