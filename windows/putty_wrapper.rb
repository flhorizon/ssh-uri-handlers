
require 'addressable/uri'

uri = Addressable::URI.parse ARGV[0]
exit unless uri and uri.scheme == 'ssh'

port_tok = uri.port ? "-P #{uri.port.to_s}" : ''
user_tok = uri.user ? "-l #{uri.user}" : ''
passwd_tok = uri.password ? "-pw #{uri.password}": ''

command = "putty -ssh #{port_tok} #{user_tok} #{passwd_tok} #{uri.host}"
exec command