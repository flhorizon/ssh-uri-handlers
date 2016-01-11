#!/usr/bin/ruby


HandOver_tok = '--DO'
unless ARGV[0] == HandOver_tok

    # Execute LXDEterminal and make it run the rest of this script,
    # forwarding the URI argument.
    shell = ENV['SHELL'] || '/bin/sh'
    work_dir = ENV['HOME'] || '/var/tmp'

    # $0 is either run with its absolute path or searched in PATH.
    command = %q|lxterminal --working-directory=%s --command="/bin/sh -c '%s %s %s; %s'"|
    interp = [] << work_dir << $0 << HandOver_tok << ARGV.join(' ') << shell

    exec command % interp
end

require 'addressable/uri'

uri = Addressable::URI.parse ARGV[1]
exit unless uri and uri.scheme == 'ssh'

port_tok = uri.port ? "-p #{uri.port.to_s}" : ''
user_tok = uri.user ? "#{uri.user}@" : ''
if uri.password
    ENV['SSHPASS'] = uri.password
    passwd_tok = 'sshpass -e'
else
    passwd_tok = ''
end

command = %Q|#{passwd_tok} ssh #{port_tok} #{user_tok}#{uri.host}|
exec command
