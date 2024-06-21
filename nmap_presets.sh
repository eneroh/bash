#!/bin/zsh

# What is the purpose of this script?
# Have you seen how long the OSCP exam is? It's only 24 hours. That means you need to squeeze as much time as humanly possible out and limit time wasted writing endless commands
# It is common for professional pen testers to have their own document they can refer to when performing a pentest
# Well this will tie into that document called the <name pending> and will make the process of basic nmap commands much faster. Also this will significantly improve my knowledge on bash and nmap as a whole
# More features pending

echo "Welcome to eneroh's nmap presets!\n"
echo "1. Basic scan (nmap <targetIP) [X.X.X.X]: "
echo "2. Host discovery (nmap -sn $targetIP) [X.X.X.0/CIDR]: "
echo "3. HTTP port 80 specific scan (nmap -p80 <targetIP>) [X.X.X.X]: "
echo "3. HTTPS port 443 specific scan (nmap -p443 <targetIP>) [X.X.X.X]: "
echo "4. HTTP port specific scan with Versioning (nmap -p80 -sV <targetIP>) [X.X.X.X]: "
echo "5. HTTPS port specific scan with Versioning (nmap -p443 -sV <targetIP>) [X.X.X.X]: "
read resp

num='^[0-9]+$'
tIPstandard='^[0-9]+[.]+[0-9]+[.]+[0-9]+[.]+[0-9]$'

if [[ $resp = 1 ]];
  then
  echo "Input targetIP: "
  read targetIP
  if [$targetIP != tIPstandard];
  then
  echo "Please input valid IPAddress [X.X.X.X]: "
  else
    nmap $targetIP
  fi
  exit 1
#elif [[ $resp ! $num ]];
#  then
#  echo "Please input valid response!"
else
  echo "Please input valid response!"
echo "targetIP: $targeTIP [Y/n]"
fi

#nmap $targetIP

#nmap -sn $targetIP

#nmap -p80 -sV $targetIP

#nmap -p443 -sV $targetIP

#nmap -p80 -sV -sC $targetIP

#nmap -p443 -sV -sC $targetIP
