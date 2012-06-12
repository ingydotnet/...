# (Here for backwards compatibility. This is not actually a /bin/sh script, so
# the .sh name isn't quite right.)
source $DOTDOTDOT_ROOT/lib/path-manip
path-list() {
    ...path-list "$@"
}
path-remove() {
    ...path-remove "$@"
}
path-prepend() {
    ...path-prepend "$@"
}
path-append() {
    ...path-append "$@"
}
