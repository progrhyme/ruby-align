#!/usr/bin/env bash

set -eu

prog=$0
if [[ -L $0 ]]; then
  prog=$(readlink $0)
fi
basedir=$(cd $(dirname $prog)/.. && pwd)

cd $basedir
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi
if command -v bundle &>/dev/null; then
  exec bundle exec ./bin/ruby-align "$@"
else
  exec ./bin/ruby-align "$@"
fi

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<wrapper.sh> - Wrapper script to exec ruby-align

=head1 SYNOPSYS

    # Create symlink as ruby-align for wrapper.sh
    ln -s /path/to/wrapper.sh your/bin/ruby-align

=head1 AUTHORS

IKEDA Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=head1 LICENSE

The MIT License (MIT)

Copyright (c) 2016 IKEDA Kiyoshi

=cut

__EOF__

