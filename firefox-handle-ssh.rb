#!/usr/bin/ruby

$HandOver_tok = '--DO'
unless ARGV[0] == $HandOver_tok
    shell = ENV['SHELL'] || '/bin/sh'
    commands = "lxterminal --working-directory=#{ENV['HOME']} --command=\"/bin/sh -c '#{$0} #{$HandOver_tok} #{ARGV.join ' '}; #{shell}'\""
    exec commands
end

require 'addressable/uri'

uri = Addressable::URI.parse ARGV[1]
exit unless uri and uri.scheme == 'ssh'

port_tok = uri.port ? "-p #{uri.port.to_s}" : ''
cred_tok = uri.user ? uri.user : ''
if cred_tok.length > 0
    passwd_tok = uri.password ? ":#{uri.password}" : ''
    cred_tok << passwd_tok << '@'
end

command = "ssh #{port_tok} #{cred_tok}#{uri.host}"
exec command
