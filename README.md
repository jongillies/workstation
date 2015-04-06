Workstation
======
```workstation.sh``` is a script to set up an OS X computer for development.

It can be run multiple times on the same machine safely. It installs,
upgrades, or skips packages based on what is already installed on the machine.

Requirements
------------

Workstation supports clean installations of these operating systems:

* [OS X Yosemite (10.10)](https://www.apple.com/osx/)
* OS X Mavericks (10.9)

Older versions may work but aren't regularly tested. Bug reports for older
versions are welcome.

What it sets up
---------------

* [Flux] for adjusting your Mac's display color so you can sleep better
* [GitHub for Mac] for setting up your SSH keys automatically
* [Homebrew] for managing operating system libraries
* [Homebrew Cask] for quickly installing Mac apps from the command line
* [Homebrew Services] so you can easily stop, start, and restart services
* [RVM] for managing Ruby versions (includes [Bundler] and the latest [Ruby])

Plus, additional customizations and installations can be specified!

Install
-------

Begin by opening the Terminal application on your Mac. The easiest way to open
an application in OS X is to search for it via [Spotlight]. The default
keyboard shortcut for invoking Spotlight is `command-Space`. Once Spotlight
is up, just start typing the first few letters of the app you are looking for,
and once it appears, press `return` to launch it.

In your Terminal window, copy and paste each of these commands one at a
time, then press `return` after each one:

```bash
git clone https://github.com/jongillies/workstation.git
cd workstation
```

Customize in `~/.workstation.local.sh`
------------------------------

Copy the local customization script:

```bash
cp workstation.local.sh ~/.workstation.local.sh
```

Your `~/.workstation.local.sh` is run at the end of the `workstation.sh` script.
Put your customizations there. This repo already contains a `.workstation.local.sh`
you can use to get started. It lets you install the following tools
(commented out by default):

* [CloudApp] for sharing screenshots and making an animated GIF from a video


* [Adium] - Adium is a free instant messaging application
* [Amazon Cloud Drive] - Amazon Cloud Drive
* [Apache Directory Studio] - Apache Directory Studio is a complete directory tooling platform intended to be used with any LDAP server
* [App Cleaner] - An uninstaller like AppCleaner will make sure all unwanted files are removed.
* [Avast] - Virus protection
* [Boot2Docker Status] - Status bar application to manage the state of your Boot2Docker VM
* [Boot2Docker] - boot2docker is a lightweight Linux distribution based on Tiny Core Linux made specifically to run Docker containers.
* [Cool Term'] - CoolTerm is a simple serial port terminal application
* [Cyberduck'] - Libre FTP, SFTP, WebDAV, S3 & OpenStack Swift browser for Mac
* [Dropbox] - Cloud based files
* [Evernote] - Cloud based notes
* [Firefox] for testing your Rails app on a browser other than Chrome or Safari
* [Flash Player] - Flash Player
* [Chrome] - 
* [Google Drive] - 
* [Handbrake] - 
* [Intellij IDEA] - 
* [iTerm2] -
* [Jaikoz] - 
* [Jing] - 
* [Joinme] - 
* [Keepassx] - 
* [Lastpass] - 
* [MacPar Deluxe] - 
* [Menu Meters] - 
* [MYSQL Workbench] - 
* [Unison] - 
* [PyCharm] -
* [Rubymine] - 
* [Skype] - 
* [Snagit] - 
* [Source Tree] - 
* [Steam] - 
* [Sublime Text 3] for coding all the things
* [Text Wrangler] - 
* [Transmission] - 
* [Transmission Remote GUI] - 
* [Vagrant Manager] - 
* [Vagrant] - 
* [Virtualbox] - 
* [VlC] - 
* [VMware Fusion] - 



To install any of the above tools, uncomment them from `.workstation.local.sh` by
removing the `#`. For example, to install CloudApp, your `.workstation.local.sh`
should look like this:

```bash
#!/bin/sh

# brew_cask_install 'atom'
brew_cask_install 'cloud'
# brew_cask_install 'firefox'
# brew_cask_install 'iterm2'
```

Write your customizations such that they can be run safely more than once.
See the `workstation.sh` script for examples.

Laptop functions such as `fancy_echo`, `brew_install_or_upgrade`,
`gem_install_or_update`, and `brew_cask_install` can be used in your
`~/.workstation.local.sh`.

After you have made any customizations to ~/.workstation.local.sh, lets get setup.
Run the following:

```bash
./workstation.sh
```

[Adium]: https://adium.im/
[Amazon Cloud Drive]: https://www.amazon.com/clouddrive/home
[Apache Directory Studio]: https://directory.apache.org/studio/
[App Cleaner]: http://appcleaner.en.softonic.com/mac
[Avast]: https://www.avast.com/en-us/index
[Boot2Docker Status]: https://github.com/nickgartmann/boot2docker-status
[Boot2Docker]: http://boot2docker.io/
[Cool Term]: http://www.macupdate.com/app/mac/31352/coolterm
[Cyberduck]: https://cyberduck.io/?l=en
[Dropbox]: https://www.dropbox.com/
[Evernote]: https://evernote.com/
[Firefox]: https://www.mozilla.org/en-US/firefox/new/
[Flash Player]: https://get2.adobe.com/flashplayer/
[Chrome]: http://www.google.com/chrome/
[Google Drive]: https://www.google.com/drive/
[Handbrake]: https://handbrake.fr/
[Intellij IDEA]: https://www.jetbrains.com/idea/
[iTerm2]: http://iterm2.com/
[Jaikoz]: http://www.jthink.net/jaikoz/
[Jing]: https://www.techsmith.com/jing.html
[Joinme]: http://www.join.me
[Keepassx]: https://www.keepassx.org/
[Lastpass]: https://lastpass.com/
[MacPar Deluxe]: http://gp.home.xs4all.nl/Site/MacPAR_deLuxe.html
[Menu Meters]: http://www.ragingmenace.com/software/menumeters/
[MYSQL Workbench]: https://www.mysql.com/products/workbench/
[Unison]: http://www.panic.com/blog/the-future-of-unison/
[PyCharm]: https://www.jetbrains.com/pycharm/
[Rubymine]: https://www.jetbrains.com/ruby/
[Skype]: http://www.skype.com/en/
[Snagit]: http://discover.techsmith.com/try-snagit/
[Source Tree]: https://www.atlassian.com/software/sourcetree/overview
[Steam]: http://store.steampowered.com
[Sublime Text 3]: http://www.sublimetext.com/
[Text Wrangler]: http://www.barebones.com/products/textwrangler/
[Transmission]: http://www.transmissionbt.com/
[Transmission Remote GUI]: https://code.google.com/p/transmisson-remote-gui/
[Vagrant Manager]: http://vagrantmanager.com/
[Vagrant]: https://www.vagrantup.com/
[Virtualbox]: https://www.virtualbox.org/
[VLC]: http://www.videolan.org/vlc/index.html
[VMware Fusion]: http://www.vmware.com/products/fusion

[Spotlight]: https://support.apple.com/en-us/HT204014
[Bundler]: http://bundler.io/
[Flux]: https://justgetflux.com/
[GitHub for Mac]: https://mac.github.com/
[Heroku Toolbelt]: https://toolbelt.heroku.com/
[Homebrew]: http://brew.sh/
[Homebrew Cask]: http://caskroom.io/
[Homebrew Services]: https://github.com/gapple/homebrew-services
[hub]: https://github.com/github/hub
[Ruby]: https://www.ruby-lang.org/en/
[RVM]: https://github.com/wayneeseguin/rvm
[Atom]: https://atom.io/
[CloudApp]: http://getcloudapp.com/


It should take less than 15 minutes to install (depends on your machine and
internet connection).


Credits
-------

This laptop script is inspired by
[thoughbot's laptop](https://github.com/thoughtbot/laptop) script.

### Public domain

thoughtbot's original work remains covered under an [MIT License](https://github.com/thoughtbot/laptop/blob/c997c4fb5a986b22d6c53214d8f219600a4561ee/LICENSE).

My work on this project is in the worldwide [public domain](LICENSE.md), as are contributions to my project. As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

