#!/bin/zsh


echo "Welcome to eneroh's nmap presets!\n"
echo "1. Basic scan (nmap <targetIP) [X.X.X.X]: "
echo "2. Host discovery (nmap -sn $targetIP) [X.X.X.0/CIDR]: "
echo "3. HTTP port 80 specific scan (nmap -p80 <targetIP>) [X.X.X.X]: "
echo "3. HTTPS port 443 specific scan (nmap -p443 <targetIP>) [X.X.X.X]: "
echo "4. HTTP port specific scan with Versioning (nmap -p80 -sV <targetIP>) [X.X.X.X]: "
echo "5. HTTPS port specific scan with Versioning (nmap -p443 -sV <targetIP>) [X.X.X.X]: "
read resp

num='^[0-9]+$'
tIPstandard=
tIPstandardCidr="^[0-9]+[.]+[0-9]+[.]+[0-9]+[.]+[0-9]+[\/]+[0-9]+[0-9]$"

case $resp in
        1)
         echo "Input targetIP: "
         read targetIP
         if [ $targetIP != ^[0-9]{1,3}[\.][0-9]{1,3}[\.][0-9]{1,3}[\.][0-9]{1,3}$ ];
         then
           echo "Please input valid IPAddress [X.X.X.X]: "
         else
           nmap $targetIP
         fi
         ;;
        2)
         echo "Input targetIP: "
         read targetIP
         if [[ $targetIP != $tIPstandard ]];
         then
           echo "Please input valid IPAddress [X.X.X.X/XX]: "
         else
           nmap -sn $targetIP
         fi
         ;;
        #3)
        #4)
        #5)
        *)
          echo "Please enter valid option!"
         ;;
esac

#nmap $targetIP

#nmap -sn $targetIP

#nmap -p80 -sV $targetIP

#nmap -p443 -sV $targetIP

#nmap -p80 -sV -sC $targetIP

#nmap -p443 -sV -sC $targetIP
