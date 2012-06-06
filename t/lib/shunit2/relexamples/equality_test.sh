#! /bin/sh
# file: examples/equality_test.sh

testEquality()
{
  assertEquals 1 1
}

SHUNIT_PARENT=$0
setopt shwordsplit

# load shunit2
. src/shunit2
