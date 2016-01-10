# SSH URI handlers
Quick hacks to add SSH URI handling on systems I use (Linux/LXDE, Windows); with a focus on Firefox.

## Details
Hacked for ruby 2.1.  
Requires the 'addressable' gem.  
  
Configuring Firefox:   
http://kb.mozillazine.org/Register_protocol   
This step essentially boils down to creating a variable in `about:config` :   
`network.protocol-handler.expose.ssh` with value `False`.   
Firefox will then ask for a handler when trying to use an SSH URI.
