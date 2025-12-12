sudo apt install libdatetime-perl libjson-xs-perl libperlio-gzip-perl libcapture-tiny-perl libtimedate-perl
git clone https://github.com/linux-test-project/lcov.git
make PREFIX=$(realpath ..)/install install
export PATH=$(realpath .)/lcov/install/bin/:$PATH
