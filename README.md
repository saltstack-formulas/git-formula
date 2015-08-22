# git

Install git either by source or by package

## Tested minion OS's

- Ubuntu 12.04.3 Server AMD64
- Ubuntu 14.04.1 LTS
- CentOS release 6.6 (Final)
- Red Hat Enterprise Linux Server release 6.6 (Santiago)

# Available states

### git
Installs git either via package or source, as specified in the pillar data.

### git.package
Installs git via system package.

### git.source
Compiles and installs the latest git directly from source.

### git.pkgrepo
Sets up a package repo containing the most recent git package. Currently only used for Ubuntu git PPA.
