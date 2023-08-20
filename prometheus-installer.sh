#!/bin/bash

#This is to inforce supplying download location
if [ $# -lt 1 ]
then
  echo "invalid parameters. script will now end"
  exit 1
fi

# this is setting important variables
download_endpoint=$1
install_location="${2:-/home/ec2-user/prom/}"
run_prom_after_install="${3:-yes}"

echo download_endpoint is "[ $download_endpoint ]"
echo install_location is "[ $install_location ]"
echo run_prom_after_install is "[ $run_prom_after_install]"

#create and change to given directory
echo "create and changing to $install_location"
mkdir -p "$install_location
cd "$install_location"

#download binary
echo "downloading file..."
wget $download_endpoint

#unpack binary
echo "extracting file..."
sleep 3
tar xvf prometheus-2.46.0.linux-amd64.tar.gz

echo "done"

#execute prometheus
cd prometheus-2.46.0.linux-amd64/
./prometheus



