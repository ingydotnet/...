# This has to be in a file where bash won't read it and emit a syntax error.
for n in $^dotdotdot_order/$1(N); do
    ...source $n
done
