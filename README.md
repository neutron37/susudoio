# Susudoio

susudoio wraps su+sudo into one-easy-step for non-admin MacOS users :)

If you're using an admin account as your primary, this tool might not be for you.

## Usage

```
susudoio [-a] [--admin-user] [--admin-pass] [--target-user] [--help] <command>

The <command> argument is required, and all other arguents are optional:

-a              Flag to run as admin, instead of admin sudo.

--admin-user    The administrative user
                  defaults to first non-root member of the admin group.

--admin-pass    The administrative password,
                  if missing, will be asked for interactively.

--target-user   The target user
                  defaults to the current user. 
                  No effect unless you're using the included bash convenience functions.

--help          Display this help.
```

## Caveats

I'm really not sure how secure this tool is... Doesn't seem too bad. I could use some feedback on this from you lovely paranoid & evil folks out there. Thanks!

## Susudoio features & use cases

### Susudoio wraps su+sudo

This makes it easier to use a non-admin account as your primary login on MacOS.

* Only enter the admin password once, instead of one time for su and then again for sudo.
* Using brew, Docker, and other things can be slightly less annoying.
  * ex. `susudoio -a brew install junk`

### Susudoio provides bash convenience functions to any bash scripts called by it
* \<command\>
  * Runs \<command\> as root.
* susudoio::runas_admin \<command\>
  * Runs \<command\> as the admin user.
* susudoio::runas_target \<command\>
  * Runs \<command\> as the target user.

### Susudoio provides sensible defaults.

* Defaults to running commands as root via su+sudo, but with the -a flag privaleges will only escalate to admin.
* Guesses the admin user for you if you don't specify one.

### Susudoio simplifies bootstrapping a new MacBook

* zero install dependencies. Works on fresh MacOS install.
* You can pass the admin password as an argument. Must be used with caution!

## Potentially annoying security tips

Use a Yubikey for your admin / sudo authentication. Heck, use a different one for your non-admin authentication. Use FileVault! Try not to blindly trust brew, docker, npm, or package manager x. Re-install everything from scratch often, daily if possible.

## Up next

See https://github.com/neutron37/susudoio/issues
