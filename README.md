# rpm-tom-foolery

## Creating the RPMS
### Prerequisites
`[root@mom ~]# rpm -qf /usr/bin/rpmbuild`

`rpm-build-4.11.3-21.el7.x86_64`
### Generate RPMS
Simply run the `make_rpms.sh` script. Modify its parameters to create more than eleven RPMS. The `clean_up.sh` script is just a development nicety and should not normally be run. It will nuke your rpmbuild directory. Apologies in advance.

## Creating the Repo
### Prerequisites
`[root@gmom ~]# rpm -qf /usr/bin/createrepo`

`createrepo-0.9.9-26.el7.noarch`
### Generate the RPM Repository
From the directory holding the RPM packages, run:

`[root@mom x86_64]# createrepo --database .`

You could use a web server to host the repository, but simply copying the repo to a local file system is easiest.

`[root@mom x86_64]# cat /etc/yum.repos.d/local.repo`

`[local_repo]`

`name=LocalRepo`

`baseurl="file:///root/rpmbuild/RPMS/x86_64"`

`gpgcheck=0`

## Creating the Chaos
Run the `change_rpms.sh` script via crond to randomly select new RPMS every run.
