#!/bin/bash

# check if system is Linux or MacOS
if [ "$(uname)" == "Darwin" ]
then
  # install tools using brew
  brew install --ignore-missing subfinder dirsearch massdns sublist3r ffuf waybackurls nmap vulners getjs getallurls xsshunter sqlmap xxeinjector ssrfdetector gittools gitallsecrets corstest eyewitness parameth
else
  # update package lists
  apt-get update

  # install tools using apt-get
  apt-get install -y subfinder dirsearch massdns sublist3r ffuf waybackurls nmap vulners getjs getallurls xsshunter sqlmap xxeinjector ssrfdetector gittools gitallsecrets corstest eyewitness parameth
fi

