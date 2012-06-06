#!/bin/zsh
source t/lib/test-case
source lib/scripting

testFullPath() {
    assertEquals foo "$(...source `pwd`/t/echo-foo)"
}

testRelative() {
    assertEquals foo "$(...source t/echo-foo)"
}

testRecursionGuard() {
    assertEquals '' "`...source boot-dots/anything 2>&1`"
}

testSourceif() {
    assertEquals foo $(...sourceif t/echo-foo)
    assertEquals '' "$(...sourceif t/_nonexistent_)"
}

testSourcedircontents() {
    assertEquals '' "$(...sourcedircontents t/echo-foo)"
    assertEquals '' "$(...sourcedircontents t/_nonexistent_)"
    cdtmp
    echo echo -n moo > a
    echo echo -n boo > b
    assertEquals "mooboo" "$(...sourcedircontents .)"
    cleantmp
}

testEach() {
    cdtmp
    mkdir a; echo -n $_ > $_/a_file
    mkdir b
    mkdir c; echo -n $_ > $_/another_file
    (
        export DOTDOTDOT_ORDER="`pwd`/a `pwd`/b `pwd`/c"
        alias ...repos=true
        assertEquals "ac" "$(...quieteach '[[ "`ls -A | wc -l`" > 0 ]] && cat *')"

        local r="`...each pwd`"
        local m=`expr "$r" : ".*In .*/a"`
        assertNotEquals "$r" 0 $m
    )
    cleantmp
}

prep-tests $0
. t/lib/shunit2/src/shunit2
