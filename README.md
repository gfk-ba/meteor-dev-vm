meteor-dev-vm
=============

Meteor development VM

Prerequisites
-------------
* Vagrant
* VirtualBox (make sure the VirtualBox version is supported by the installed Vagrant version)
* On Windows: Cygwin with bash, git and ssh packages

Instructions
------------
After cloning/forking the meteor-dev-vm repository:

``` sh
cd meteor-dev-vm/tools
./setup.sh
./run.sh
```

In your browser, the Meteor application can now be reached through [http://localhost:3000](http://localhost:3000)

Note that Meteor uses Hot Code Reload (HCR), so every time you change a source file, the application (server and client) will be reloaded.

