#!/bin/sh

# Builder of rpm 
# Run it as 
# docker run -it -v $PWD:/nagios-plugin-notebooks centos:6 /nagios-plugin-notebooks/build.sh

yum install -y epel-release
yum install -y rpm-build epel-rpm-macros python-pbr git

cd nagios-plugin-notebooks/
python setup.py sdist
mkdir -p /root/rpmbuild/SOURCES
mv dist/nagios_plugin_notebooks-*.tar.gz /root/rpmbuild/SOURCES/

rpmbuild -ba nagios-plugin-notebooks.spec 
mv /root/rpmbuild/RPMS/noarch/* .
