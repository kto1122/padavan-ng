#!/bin/sh

prefix=
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libexecpath=${exec_prefix}/libexec/mtd-utils
TESTBINDIR="."

TEST_DIR=$TEST_FILE_SYSTEM_MOUNT_DIR
if test -z "$TEST_DIR";
then
	TEST_DIR="/mnt/test_file_system"
fi

rm -rf ${TEST_DIR}/*

$TESTBINDIR/test_1 || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/test_2 || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/integck $TEST_DIR || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/rndrm00 -z0 || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/rmdir00 -z0 || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/stress_1 -z10000000 -e || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/stress_2 -z10000000 || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/stress_3 -z1000000000 -e || exit 1

rm -rf ${TEST_DIR}/*

$TESTBINDIR/fs_stress00.sh 360 || exit 1

$TESTBINDIR/fs_stress01.sh 360 || exit 1
