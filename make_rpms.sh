#!/bin/bash

echo "Let's make a lot of very empty RPM packages!"

echo "First, create rpmbuild and subdirectories"
mkdir -p rpmbuild/BUILD rpmbuild/BUILDROOT rpmbuild/RPMS rpmbuild/SOURCES rpmbuild/SPECS rpmbuild/SRPMS

echo "Next, we need a payload"
cat > hello_world << END_TEXT
#!/bin/sh
echo "hello world."
END_TEXT

echo "Next, we need spec files"
for x in `seq -w 0 10`
do
  echo "Creating spec file fakerpm$x.spec"
  mkdir -p /root/rpmbuild/BUILDROOT/fakerpm$x-1-1.el7.centos.x86_64/opt/fakerpm$x/
  cp hello_world /root/rpmbuild/BUILDROOT/fakerpm$x-1-1.el7.centos.x86_64/opt/fakerpm$x/
  cat > fakerpm$x\.spec << END_TEXT
Name:		fakerpm$x
Version:	1
Release:	1%{?dist}
Summary:	A fake rpm
License:	GPL

%description
This is just a fake rpm. We want the RPM database to have lots of changes.

%prep
mkdir -p /opt/fakerpm$x

%files

%defattr(700,root,root,-)
/opt/fakerpm$x/hello_world
END_TEXT
  echo "Building the rpm"
  rpmbuild -ba fakerpm$x\.spec
done
