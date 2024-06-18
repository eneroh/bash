#!/bin/zsh

# eneroh's trusty nmap scan script

echo "Welcome to eneroh's trusty nmap scan script!\n"
echo 'Input targetIP X.X.X.X: ' $targetIP
read targetIP
echo "targetIP: $targetIP Y/n" $resp
read resp
if [[ $resp != [Yy] ]]
then
  exit 1
else
  echo "Response confirmed: $resp"
  echo "nmap scan initialized\n"
fi

nmap $targetIP
