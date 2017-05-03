# DOS BBS client and server

This image is designed to let you run a DOS BBS inside Docker, or to connect
to a remote BBS.  It can be used standalone, or as a base for other images.

It is based upon:
 - [My qemu FreeDOS environment for Docker](https://github.com/jgoerzen/docker-qemu-dos)
 - [tcpser](https://packages.debian.org/jessie/tcpser) to simulate a modem.
 - [Balance](http://www.inlab.de/balance.html) to distribute incoming Telnet
   sessions to nodes.

An additional environment variable, BBSNODES, can be set to indicate how many nodes to
start.  It defaults to 0 in this image, and can also be set within the image
by modifying `/dos/numnodes`.

# Install and run

You can install with:

    docker pull jgoerzen/dos-bbs

And run with:

    docker run -d -p 5901:5901 -p 23:23 --name dos-bbs jgoerzen/dos-bbs

# Installed files

Here's what you can find in this image.

 - `/dos/drive_*` corresponds to particular DOS drives.
 - Within DOSBox:
   - `H:\SCRIPTS` is a convenient place to drop scripts as needed; also on the PATH
   - `H:\ADF` containts the ADF FOSSIL driver.
   - `H:\COMM` contains Telix and Telemate, nice DOS BBS clients.
   - `G:\DOORS` contains a few DOS DOOR games.
 - Config files:
   - `/dos/numnodes` is the default number of nodes to start.  This image 
      sets it to 0, and by default supports 9 (more could be supported 
      via additional supervisor scripts). The `BBSNODES` environment
      variable can override this setting.
   - `/dos/addtoboot` contains additional commands to run at the boot time
     of a node (but not the main console).  This would be a place to
     fire up a BBS.

See the jgoerzen/qemu-dos documentation for the recommendations on child image
usage of these drives.

Note: this image provisions a number of files in /etc/supervisor.d/conf.d. 
Child images may want to modify them.

# VNC Console

VNC is exposed on port 5901.  You can connect to this port.  You will see, by default,
an xterm (white) and a qemu terminal (black) running here, though
child images may alter these defaults.

# Telnet ports

Telnet is exposed on port 23, and runs the TelnetBBS system.

Within the image, port 8000 will connect you to the emulated modem
in the default console.  Ports 8001 and above are used for the
BBS node system.  You will probably never need to work with these directly.

# Dialing into DOS BBSs

From the VNC console with the default setup, you can dial into various BBSs.  Here is an
example of what to type to get started:

   g:
   cd \comm\tm
   tm

This starts Telemate.  Now, close the blue phonebook with Esc and type:

    ATDTbbs.starbase21.net

This will begin a Telnet session with the simulated modem.  Note also
that you can add a port number with :port at the end (eg, `ATDTbbs.starbase21.net:23`).

Alt-X exits Telemate.

# Source

This is prepared by John Goerzen <jgoerzen@complete.org> and the source
can be found at https://github.com/jgoerzen/docker-qemu-dos

# More resources

 - [Telnet to a BBS within DosBOX](http://breakintochat.com/blog/2013/04/17/telnet-to-bbs-within-dosbox-emulator/)
 - [Telemate v4.2x under DOSBox Tutorial](http://www.starbase21.net/telemate.html)
 - [Reddit: Using DosBox to Dial into Telnet boards](https://www.reddit.com/r/retrobattlestations/comments/5o5edj/using_dosbox_to_dial_into_telnet_boards/)
 - [Configuring DOSBox to allow inbound and outbound telnet connections](https://www.megaplonk.com/wiki/doku.php?id=emulation_and_virtualization:configuring_dosbox_to_allow_inbound_and_outbound_telnet_connections_as_if_dial-up_modem_calls)
 - [DOS BBS files](http://archives.thebbs.org/)

# Copyright

Docker scripts, etc. are
Copyright (c) 2017 John Goerzen 
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Additional software copyrights as noted.

