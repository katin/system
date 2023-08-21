# system
system commands, utilities, setup, and supplemental tools and resources

----
### github quick keys (utility scripts)
Github repos are a great way to share, record, and backup your work. Unfortunately, if you end up using multiple machines or re-installing your OS often, getting your local git setup for easy comms and commits can be a step that just slows you down.

Two new scripts help with this. 
```
# github-newkeys.sh <USERNAME ACCTMAIL>
```
Creates a new ssh key pair and displays the public key to easily copy to your github account. Won't overwrite previous keys even of the same username.
```
# setgitcontext.sh <CONTEXT | USERNAME ACCTMAIL>
```
Sets your local git identity and test the corresponding ssh key with github.com to make sure it's set up and working. From then on, it's push and pull commands all day long without ever entering a password.

Go even faster with a data file of account names.
github quick keys documentation is in the [github-quickkeys.md](./github-quickkeys.md) file.

----

