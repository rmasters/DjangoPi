DjangoPi
=
A Amazing one-click Django installer for Raspberry pi.

----------

This package provides an easy way to install Django on the Raspberry pi.

It also installs a few useful applications at the same time:

 - MySQL database
 - Apache
 - pip
 - gunicorn

Usage
=

NOTE: This has only been tested on the official debian flavour of linux for the raspberry pi.

- To make things easier type:

```Python
sudo bash
```

This will give you administrative privelleges.

 - Type:

```Python
chmod 777 DjangoPi.sh
```

to make the file executable

- DjangoPi only takes one line of code to set up:

```Python
./djangopi.sh
```

NOTE: this will take a long time if you're running it on a clean install, so go grab a cup of tea.

Adding your other packages
=

You can add your own packages to the intallation by typing the package name at the bottom of the reuquirements.txt and running djangopi again.

Authors
=

Paul Hallett www.phalt.co.uk
