export PATH=/opt/gcc-latest/bin:$PATH
export PATH=$(realpath .)/lcov/install/bin/:$PATH

rm -rf kernel.lcov.info
lcov --ignore-errors inconsistent,missing,mismatch,negative \
--mcdc-coverage \
--branch-coverage \
--directory gcov-data --capture --output-file kernel.lcov.info

rm -rf gcov-reports
genhtml \
--mcdc-coverage \
--branch-coverage \
--ignore-errors inconsistent,missing \
kernel.lcov.info --output-directory gcov-reports
