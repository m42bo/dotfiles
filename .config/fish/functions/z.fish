function z; set -l result (bash -c "source ~/.local/bin/z.sh && _z $argv && pwd"); if test -n "$result"; cd $result; end; end
