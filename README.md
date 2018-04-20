# susudoio
Non-admin MacOS user? susudoio wraps su+sudo into one-easy-step!

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  SUSUDOIO                       ...whoa oh oh ┃
┃                                               ┃
┃  Wraps su and sudo for non-admin MacOS users. ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
                                ©2018 Neutron37

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ WARNING:                                      ┃
┃ This script might not be the most secure...   ┃
┃                         Use with caution!!!   ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

usage: susudoio [-a] [--admin-user] [--admin-pass] [--target-user] [--help] <command>

The <command> argument is required, and all other arguents are optional:

-a              Flag to run as admin, instead of admin sudo.

--admin-user    The administrative user
                  defaults to first non-root member of the admin group.

--admin-pass    The administrative password,
                  if missing, will be asked for interactively.

--target-user   The target user
                  defaults to the current user.

--help          Display this help.
```

## Goals:

* Allows you to be lazy and (hopefully, see caveats) secure. Only enter admin password once per instantiation.
* Leverage sudo from a non-admin account.
* Simplifies bootstrapping a Mac when your primary login is non-admin.
* Simplifies using a Mac when your primary login is non-admin. (ex. brew, Docker, and other annoying things.)
* Zero install dependencies. Works on fresh MacOS install.

## Caveats:

I'm not sure how secure this is... Doesn't seem too bad. I could use some feedback on this from the pranoid & evil folks out there. Thanks!
