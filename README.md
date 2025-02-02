# bash

## Summary
This document will display my bash scripting knowledge and act as a cheatsheet for projects that require bash.

## Commands
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
awk '{print $1,$2,$3}'
```
Displays specific word/words, column specific
<br>
$1 - column 1
<br>
$2 - column 2
<br>
$3 - column 3
<br>
etc.

```bash
which <program>
```
Displays a place where you can find the program

```bash
whereis <program>
```
Displays ALL places where you can find the program
```bash
whatis <program>
```
Displays program info

```bash
kill -9 <pid>
```
Kill specific process by process no.

```bash
pkill -f <process>
```
Kill specific process by name

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
fzf
```
Fuzzy finder

```bash
exit
```
Exit program
<br>
Can also be used in scripts to escape when things go wrong

```bash
finger <user>
```
Shows complete account information on debian based systems

```bash
w
```
Shows user login info and activity

```bash
alias
alias <aliasname>="<command>"
```
Stdout can be sent to a file output
<br>
Can be placed into zshrc or bashrc, available every session

```bash
!!
```
Returns previous command

```bash
ssh <user>@<host>/<ip>
```
Remoting tool to remote onto specific devices

```bash
scp <user>@<host>:~/ <user>@<device>:~/
```
scp or secure copy and paste can be utilized to move a file or multiple files between two different devices

```bash
crontab
crontab -e
crontab -l
```
Task scheduler for specific distros (particularly debian based)
<br>
Task scheduler editor (guided)
<br>
Dispalys all tasks scheduled by user

```bash
vim <file>
```
Text editor

```bash
nano <file>
```
Text editor

```bash
killall <program>
```
Kill all instances of program

```bash
chmod
chmod u+x ./hello.sh
```
Change mode permissions
Provides user execute permissions
Can also be performed with numbers (octal)
Ties into ls -l

```bash
diff <file1> <file2>
```
Compares the difference between two different files

```bash
bc
```
Calculation language in terminal

```bash
SUBTRACT=$((640-354))
echo $SUBTRACT
```
Perform calculations in terminal

```bash
>&2
```
redirect stdout to stderr
<br>
generally the better place to send logging output that isn't the actual result of the computation

```bash
>/dev/null
```
discards STDOUT or output

```bash
uptime
uptime -p
```
Displays uptime
<br>
Displays uptime in <b>p</b>retty format

```bash
acpi
acpi -b
acpi -i
acpi -V
acpi -t
```
Basic battery info
<br>
Basic battery info as well
<br>
Design capacity information
<br>
Everything
<br>
Thermal details

## Scripts

```bash
#!/usr/bin/env bash
set -euo pipefail
```
Best way to start off bash scripts

```bash
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
```
Displays the top 10 most used bash terminal commands

```bash
ps -aux | grep <program>
```
Locate specific process

```bash
$(<command>)
echo "My current directory is: $(pwd)"
```
Subshell

```bash
>
ls --help > ls-help.txt
```
Overwrites over the file
<br>
Stdout can be sent to a file output

```bash
ls --help >> ls-help.txt
```
appends to end of file

```bash
compgen -c | fzf | xargs man
```
Find a command, then read it's related man page

```bash
du -ah . | sort -hr | head -n 10
```
Find the biggest files/directories

```bash
ping -c 1 "github.com" | grep time && echo "it's alive"
```
Conditional response, if the ping is successful and if grep sees "time", then the terminal returns the word "it's alive"

```bash
echo "What is your name?"
read -r name
echo "Hello $name!"
```
Reads user input in the command mentioned, then reflects that command

```bash
read -p "Do you want to continue (Y/n) " resp
if [[ $resp != "Y" ]]; then
  exit 1
fi
echo "Continuing..."
```
Reads the user input of Y or n then provides response

```bash
if [[ some_condition ]]; then
  echo "This condition is true"
elif [[ some_other_condition ]]; then
  echo "This other conditon is true"
else
  echo "Non of the conditions were true"
fi
```
if conditional statement layout

```bash
ls | grep '<word>'
```
Look for specific file containing specific word or file format

```bash
cat <file> | grep 'word'
```
Look for specific phrase/word in specified file

```bash
kill $(ps aux|grep <item to kill>)
```
Kills all instances of program
