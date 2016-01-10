## About choices

Windows handles URIs at system level through registry keys from HKCR\\\<TYPE\>.   
Firefox still needs some about:config tweaking, but with:    
`network.protocol-handler.expose.ssh` at value `False`  
it may prompt for a handler (with the registry one as default).

I chose _putty_ to connect through SSH, although there appears to be a few alternatives out there.
_putty_ does not handle SSH URIs as a commandline parameter (yet?), so I'm using a wrapper there, too.

Powershell has a nice builtin URI parser, but running a Powershell script requires execution policy configuration and|or self-signing (which involves creating a self-signed certificate).
This is quite a hassle to go through and implies meaningful changes security-wise.   
Alternatively, it looks definitly possible to stuff the powershell command inside a .bat file (and take the hassle of properly escaping things) with:   
`Powershell -Command "ESCAPED PS CODE HERE"`

A fully operational ruby environment on Windows enabled me to re-use the 'addressable/uri' parsing to run a custom command with no effort.

## Configuration and Usage

Requires ruby (works with 2.2)   
Requires the 'addressable' gem   
Requires putty   
   
1. Optionally add the SSH URI handling to the registry :
 - (it allows running more complex commands than PATH\\TO\\EXE.EXE URI)
 - tweak the command at the end of the **.reg.template** file (the **.reg.sample** is mine, as an example)
 - pop the fake extension(s) down to **.reg** and run the reg file.
2. Tweak the ruby script if *putty.exe*'s directory is not in `%PATH%`
3. Firefox: add at least `network.protocol-handler.expose.ssh` with `False` to `about:config`
4. Re-run firefox and click an SSH URI; choose the handler or browse to another.
