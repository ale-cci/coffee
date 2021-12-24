set -e
llc --relocation-model=pic "$1.ll"
gcc $1.s -o $1
