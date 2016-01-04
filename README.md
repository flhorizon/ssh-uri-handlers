# firefox-lxde-ssh-uri-handler
A quick hack to enable Firefox to handle SSH URIs under LXDE.

## Details
Hacked for ruby 2.1.  
Requires the 'addressable' gem.  
  
Configuring Firefox:   
http://kb.mozillazine.org/Register_protocol   
This step essentially boils down to creating a variable in `about:config` :   
`network.protocol-handler.expose.ssh` with value `False`.   
Firefox will then ask for a handler when trying to use an SSH URI.

## Action
Executes `lxterminal` with a command running `ssh` with the URI's parameters; handing back a regular shell afterwards.
