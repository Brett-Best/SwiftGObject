# SwiftGObject
A Swift wrapper around gobject-2.x that is largely auto-generated from gobject-introspection

## Prerequisites

### Swift

To build, you need a very recent Swift compiler (Swift 3.0 Preview 3 at the time of this writing, download from https://swift.org/download/ -- if you are using macOS, make sure you have the command line tools installed as well).  Test that your compiler works using `swift --version`, which should give you something like

	$ swift --version
	Apple Swift version 3.0 (swiftlang-800.0.34.6 clang-800.0.33)
	Target: x86_64-apple-macosx10.9

on macOS, or on Linux you should get something like:

	$ swift --version
	Swift version 3.0 (swift-3.0-PREVIEW-3)
	Target: x86_64-unknown-linux-gnu

### GLib 2.46 or higher

These Swift wrappers have been tested with glib-2.46 and 2.48.  They should work with higher versions, but YMMV.  Also make sure you have `gobject-introspection` and its `.gir` files installed.

#### Linux

On Ubuntu 16.04, you can use the gtk that comes with the distribution.  Just install with the `apt` package manager:

	sudo apt update
	sudo apt install libglib2.0-dev glib-networking gobject-introspection libgirepository1.0-dev

If you prefer a newer version of gtk, you can also install it from the GNOME 3 Staging PPA (see https://launchpad.net/~gnome3-team/+archive/ubuntu/gnome3-staging), but be aware that this can be a bit dangerous (as this removes packages that can be vital, particularly if you use a GNOME-based desktop), so only do this if you know what you are doing:

	sudo add-apt-repository ppa:gnome3-team/gnome3-staging
	sudo apt update
	sudo apt dist-upgrade
	sudo apt install libglib2.0-dev glib-networking gobject-introspection libgirepository1.0-dev

#### macOS

On macOS, you can install glib using HomeBrew (for setup instructions, see http://brew.sh).  Once you have a running HomeBrew installation, you can use it to install a native version of glib:

	brew update
	brew install glib glib-networking gobject-introspection


## Building
Normally, you don't build this package directly, but you embed it into your own project (see 'Embedding' below).  However, you can build and test this module separately to ensure that everything works.  Make sure you have all the prerequisites installed (see above).  After that, you can simply clone this repository and build the command line executable (be patient, this will download all the required dependencies and take a while to compile) using

	git clone https://github.com/rhx/SwiftGObject.git
	./build.sh
	./test.sh

### Xcode

On macOS, you can build the project using Xcode instead.  To do this, you need to create an Xcode project first, then open the project in the Xcode IDE:

	./xcodegen.sh
	open GObject.xcodeproj

After that, use the (usual) Build and Test buttons to build/test this package.




## Troubleshooting
Here are some common errors you might encounter and how to fix them.

### Old Swift toolchain or Xcode
If you get an error such as

	$ ./build.sh 
	error: unable to invoke subcommand: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-package (No such file or directory)
	
this probably means that your Swift toolchain is too old.  Make sure the latest toolchain (Swift 3 preview 3 at the time of this writing) is the one that is found when you run the Swift compiler, e.g.:

	$ swiftc --version
	Apple Swift version 3.0 (swiftlang-800.0.34.6 clang-800.0.33)
	Target: x86_64-apple-macosx10.9

  If you get an older version, make sure that the right version of the swift compiler is found first in your `PATH`.  On macOS, use xcode-select to select and install the latest version, e.g.:

	sudo xcode-select -s /Applications/Devel/Xcode-beta.app
	xcode-select --install

