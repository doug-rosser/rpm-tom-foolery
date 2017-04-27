#!/bin/bash

echo "Removing rpmbuild directory"
rm -rf /root/rpmbuild

echo "Removing the payload file"
rm -f hello_world

echo "Removing spec files and rpms"
for x in `seq -w 0 10` 
do
  rm -f fakerpm$x\.spec
  rpm -e fakerpm$x
done
