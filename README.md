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

## susudoio features & use cases

### Susudoio wraps su+sudo to make it easier to use a non-admin account as your primary login on MacOS.

* Using brew, Docker, and other things can be slightly less annoying.
  * ex. `susudoio -a brew install junk`
* Be lazy by only entering the admin password once per instantiation, instead of once for su and then again for sudo
* Use a Yubikey for admin /sudo stuff and don't sweat your usual (non-admin) login as much (or use a different Yubikey!).

### Susudoio provides sensible defaults.

* Defaults to running commands as root via su+sudo, but with the -a flag privaleges will only escalate to admin.
* Guesses the admin user for you if you don't specify one.

### Susudoio simplifies bootstrapping a new MacBook

* zero install dependencies. Works on fresh MacOS install.
* You can pass the admin password as an argument. Must be used with caution!

### Susudoio provides bash convenience functions any bash scripts called by it
* \<command\>
  * Runs \<command\> as root.
* susudoio::runas_admin \<command\>
  * Runs \<command\> as the admin user.
* susudoio::runas_target \<command\>
  * Runs \<command\> as the target user.
  
## Caveats:

I'm not sure how secure this is... Doesn't seem too bad. I could use some feedback on this from the pranoid & evil folks out there. Thanks!

## Up next:

See https://github.com/neutron37/susudoio/issues
