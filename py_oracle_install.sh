#!/bin/sh

# Python 3.7.4 install 

yum update -y
yum groupinstall -y "development tools"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db$
tar -xzf Python-3.7.4.tgz
cd Python-3.7.4
./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" --enable-optimizations
make && make altinstall
cd ..

# Client Oracle driver install

rpm -Uvh oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm oracle-instantclient19.3-devel-19.3.0.0.0-1.x86_64.rpm oracle-instantclient19.3-sqlplus-19.3.0.0.0-1.x86_64.rpm

rpm -Uvh glibc-2.17-55.el6.x86_64.rpm glibc-common-2.17-55.el6.x86_64.rpm glibc-devel-2.17-55.el6.x86_64.rpm glibc-headers-2.17-55.el6.x86_64.rpm

# Python oracle module install 

tar -xzf cx_Oracle-7.2.0.tar.gz
cd cx_Oracle-7.2.0
python3.7 setup.py install
cd ..

# Python test
python3.7 oracle_test.py
