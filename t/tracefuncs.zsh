#!/bin/zsh

source t/lib/test-case
source lib/tracefuncs

testColorEcho() {
    local r="`...echo_green Hihi`"
    local m=`expr "$r" : '.*\[32mHihi'`
    assertNotEquals "$r" 0 $m
}

testQuietVsVerbose() {
    assertEquals '' "`...debug Hrm.`"
    (
        ...traceon
        assertNotEquals "" "`...debug Hrm.`"
    )
}

testTracex() {
    local r="`...tracex 2>&1`"
    local m=`expr "$r" : '.*START:'`
    assertNotEquals "$r" 0 $m
}

prep-tests $0
. t/lib/shunit2/src/shunit2
