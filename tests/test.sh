#!/bin/sh
#
# a simple test script for a few more exotic wrapping cases
#

# allow override from the environment
: ${NOWRAP:=../nowrap}
: ${DIFF:=diff -q}

#set -x

rm -f *.out BOGUS

do_test() {
    prefix="$1"
    args="$2"

$NOWRAP $args $prefix.in > $prefix.out
if $DIFF $prefix.expected $prefix.out ; then
    :
else
    echo "ERROR: $prefix failed"
    err=1
fi
}

# ==== case 0: simple text, asking for narrower
do_test tc0 --columns=72

# ==== case 1: simple text but asking for wider wrap than most of the text
do_test tc1 --columns=140

# ==== case 2: simple text but don't specify columns
do_test tc2

# ==== case 3: colored text, don't specify columns
assumed_cols=238
if test `tput cols` != $assumed_cols ; then
    echo "columns are "`tput cols`" not $assumed_cols, skipping test 3"
else
    do_test tc3
fi

# ==== case 4: colored text, ask for narrower
do_test tc4 --columns=72

# ==== case 5: utf-8 text with wide characters
do_test tc5 --columns=72

# ==== case 6: UTF-8-demo.txt @ 40 columns
do_test tc7 --columns=40

if test -z "$err" ; then
    echo "PASS"
    rm -f *.out BOGUS
else
    echo "FAIL"
    exit 1
fi

