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
Scrollable human readable viewer

```bash
more
```
Same as less but can only move forward, not backward

```bash
grep
```
<br>
Displays line, pattern matching

```bash
awk
```
<br>
Displays specific word/words, column specific

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

```bash
ls
ls -latrh
ls .config
```
<br>
Lists the contents of the target directory

```bash
cd
```
<br>
Change Directory

```bash
pwd
```
<br>
Print working directory

```bash
echo
```
<br>
Prints text

```bash
cat 
```
<br>
Displays contents of file

```bash
touch
```
<br>
Create a file

```bash
cp
```
<br>
Copy file/directory to target destination

```bash
mv
```
<br>
Move file/directory to target destination

```bash
rm
rm -r
rm -rf
```
<br>
Deletes file
Deletes directory
Deletes files recursively and forcefully

```bash
ln
ln -s <file <file>
```
<br>
Create a symbolic link to a file in a different location

```bash
ls --help
```
<br>
Help page

```bash
man
```
<br>
Manual page for a specific command

```bash
find
find * -name "*<file*"
```
<br>
Find files or directories

```bash
sed
sed 's/PLACEHOLDER EMAIL TEXT/acualemail@gmail.com/' <file>
```
<br>
Find and replace text (similar to vims find and replace)

```bash
sort
sort -nr
```
<br>
Sorts text contents, default is alphabetic
Sorts text contents in numerical, reverse order

```bash
head
head -n
```
<br>
Displays first 12 lines of a file

```bash
tail
tail -f
```
<br>
Displays the last 12 lines of a file
Display the last 12 lines but FOLLOWS as new lines are added, used by devs for logs

```bash
|
```
<br>
Passes the stdout of the old command to the stdin of the new command

```bash
xargs
ls | xargs du -sh
ls | grep 'l' | xargs du -sh
```
<br>
Takes the content and splits it into chunks then passes it into an argument to what command you specify

```bash
$(<command>)
echo "My current directory is: $(pwd)"
```
<br>
Subshell

```bash
ls --help > ls-help.txt
```
<br>
> overwrites over the file
Stdout can be sent to a file output

```bash
ls --help >> ls-help.txt
```
<br>
>> appends to end of file

```bash
fzf
```
<br>
Fuzzy finder

```bash
compgen -c | fzf | xargs man
```
Find a command, then read it's related man page

```bash
alias <aliasname>="<command>"
```
<br>
Stdout can be sent to a file output
Can be placed into zshrc or bashrc, available every session

```bash
du -ah . | sort -hr | head -n 10
```
<br>
Find the biggest files/directories

```bash
!!
```
<br>
Returns previous command

