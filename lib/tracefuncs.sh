function ...istracing {
    [[ -n "$DOTDOTDOT_TRACE" ]]
}
function ...echo {
    local ansi_escape=$1
    shift
    ...istracing && echo "…\e[${ansi_escape}m$@\e[0m"
}


function ...echo_red {
    ...echo 31 "$@"
}
function ...echo_green {
    ...echo 32 "$@"
}
function ...echo_yellow {
    ...echo 33 "$@"
}
function ...echo_blue {
    ...echo 34 "$@"
}
function ...echo_cyan {
    ...echo 36 "$@"
}
function ...echo_purple {
    ...echo 35 "$@"
}
function ...echo_green {
    ...echo 35 "$@"
}

function ...debug {
    ...istracing && ...echo_blue "$@"
}
function ...debug2 {
    ...istracing && ...echo_cyan "$@"
}
function ...debug3 {
    ...istracing && ...echo_purple "$@"
}
function ...debug4 {
    ...istracing && ...echo_green "$@"
}

function ...info {
    ...echo_green "$@"
}
function ...warn {
    ...echo_yellow "$@"
}
function ...ohno {
    ...echo_red "$@"
}

function ...die {
    ...ohno "$@"
    exit 86
}

# I bet there's a way to do this without requiring $0 to be passed in. -rking
function ...filestart {
    ...istracing && ...echo 32 "START:$@"
}
function ...fileend {
    ...istracing && ...echo 32 "END:$@"
}

function ...trace {
    export DOTDOTDOT_TRACE=1
}
function ...notrace {
    unset DOTDOTDOT_TRACE
}
function ...tracesh {
    ...trace ${SHELLNAME:-$SHELL} -i -c 'echo In subshell, SHLVL=$SHLVL'
    ...info "(Back in original shell, SHLVL=$SHLVL)"
}
