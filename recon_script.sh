#!/bin/bash

# check if target domain is set as parameter
if [ -z "$1" ]
then
  # set target domain
  echo "Enter target domain:"
  read target
else
  target=$1
fi

# check if wordlist is set as parameter
if [ -z "$2" ]
then
  # set wordlist
  echo "Enter path to wordlist file:"
  read wordlist
else
  wordlist=$2
fi

# check if resolvers file is set as parameter
if [ -z "$3" ]
then
  # set resolvers
  echo "Enter path to resolvers file:"
  read resolvers
else
  resolvers=$3
fi

# run subfinder
subfinder -d $target -silent | tee subfinder.txt

# run dirsearch
dirsearch -u $target -w $wordlist | tee dirsearch.txt

# run massdns
massdns -r $resolvers -t A -o S $target | tee massdns.txt

# run sublist3r
sublist3r -d $target -o sublist3r.txt

# run ffuf
ffuf -u $target -w $wordlist -mc 200 | tee ffuf.txt

# run waybackurls
waybackurls $target | tee waybackurls.txt

# run nmap
nmap -sV -p- -oN nmap.txt $target

# run vulners
vulners -s $target | tee vulners.txt

# run getjs
getjs -u $target | tee getjs.txt

# run getallurls
getallurls -u $target -o getallurls.txt

# run xsshunter
xsshunter -u $target -o xsshunter.txt

# run sqlmap
sqlmap -u $target --batch | tee sqlmap.txt

# run xxeinjector
xxeinjector -u $target -o xxeinjector.txt

# run ssrfdetector
ssrfdetector -u $target -o ssrfdetector.txt

# run gittools
gittools -u $target -o gittools.txt

# run gitallsecrets
gitallsecrets -u $target -o gitallsecrets.txt

# run corstest
corstest -u $target | tee corstest.txt

# run eyewitness
eyewitness --web -f eyewitness.txt --threads 10 $target

