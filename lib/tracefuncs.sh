function ...debug {
    [[ -n "$DOTDOTDOT_TRACE" ]] && echo "…\e[34m$@\e[0m"
}

# I bet there's a far better way to do this. -rking
function ...filestart {
    [[ -n "$DOTDOTDOT_TRACE" ]] && echo "…\e[32mSTART:$@\e[0m"
}
function ...fileend {
    [[ -n "$DOTDOTDOT_TRACE" ]] && echo "…\e[32mEND:$@\e[0m"
}


function ...trace {
    ( export DOTDOTDOT_TRACE=1; "$@")
}
function ...tracesh { ## Eliminates the "subshell exit" step when rapid-testing.
    ...trace $SHELL -i -c exit
}
