#!/bin/bash

echo "This script will remove and install fakerpm packages randomly"

installed=`rpm -qa | grep fakerpm | cut -f1 -d'-'`

echo -e "The following packages are installed:\n$installed"

echo "Removing installed fakerpms"

yum -y remove `echo $installed`

echo "Picking new fakerpms to install"

picked=`seq -w 0 10 | shuf -n 5`

rpmlist=""

for x in $picked
do
  rpmlist+="fakerpm$x "
done

yum -y install `echo $rpmlist`
