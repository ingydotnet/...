## ... Design document

This document attempts to describe in plain language, all the things that the
`...`, dotfile management system should do.

## Historical Outline

The ... sysytem as it exists today is the result of about 8 years of managing
dot files in various contexts.

The rough history of `...` is this:

* 2006: lukec, cdent, ingydotnet and others created a system for sharing
  configs at Socialtext called `stconfig`. The main idea was to bring together
  a dev teams favorite unix confs into a pair programming environment.

* 2010: ingydotnet creates `...`, an attempt to polish stconfig for general
  use.

* 2012: rking does a ton of work on ... and related *-dots repos. Creates
  https://github.com/sharpsaw and http://sharpsaw.org (which seems to be down
  now).

* 2013: rjbs shows interest, but ... needs more love. ingydotnet writes this
  document.

## Components

The main component is https://github.com/sharpsaw/... (forked from
https://github.com/ingydotnet/...). This is the software repo which you install
simply by cloning it into `~/.../`:

    (cd; git clone https://github.com/sharpsaw/...)

You need a conf file called: `~/.../conf` which is a YAML file containing an
ordered list of -dots repos (lots of examples of which can be found here:
https://github.com/sharpsaw/). There is a template file called
`.../example.conf` with lots of comments.

The repos are cloned by `...` into `~/.../src/`.

Everytime you `... install`, the old dot files get copied into a timestamp
directory under `~/.../backup/`.

## Current Commands

To start out with a new install, first create your `~/.../conf`, then run:

    ~/.../... update    # clone/update repos (recursively w/ submodules)
    ~/.../... install   # install all new dot files and backup old ones
    exec $SHELL         # Restart your shell

TODO: finish command list

## Ideas for Moving Forward

It is probably time to rewrite ..., or at least refactor some. Here are some
ideas:

1) We could rewrite ... in Bash. It might make it more accepted, but Perl is
   pretty ubiquitous. Will hold off for now. Having it a clone/run install is
   better than putting on CPAN imho, as this is targeted at new machines. plenv
   is an example of a Perl tool written in Bash.

2) Support plugins for commands.

3) Move from yaml to ini based conf.

4) Move to a git based backup system. This would be a big win imho.

5) Make loop-dots more robust and support more conf types.

6) Make symlinks be the default (maybe only) install_method. From experience,
   symlinks are the best method. (vs copy or hardlink).

