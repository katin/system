Two scripts and a data file to make using github repos fast, secure, and easy.

### Problem
With upgraded security, github.com doesn't allow you to push repos or access private repos with your account password any longer. You have to create and use tokens, which expire and hard to use. Copy, paste, keychains, or twisted utilities to auto-supply it as needed.

### Solution
Use ssh keys instead. ssh-agent is a mature, secure, and well-integrated solution for Linux.
Two scripts make key generation and identity switching fast and easy.

### The Scripts

##### github-newkeys.sh
Use once per device to setup the unique ssh keys just for your github activity.
```
# github-newkeys.sh <USERNAME ACCTMAIL>
```
Creates a new ssh key pair and displays the public key to easily copy to your github account. Won't overwrite previous keys even of the same username.

##### setgitcontext.sh
Activate and switch between multiple github accounts (contexts) instantly. 
Loads your ssh key into ssh-agent for auto-use. (Use once per shell environment.)
```
# setgitcontext.sh <CONTEXT | USERNAME ACCTMAIL>
```
Sets your local git identity and test the corresponding ssh key with github.com to make sure it's set up and working. From then on, it's push and pull commands all day long without ever entering a password.

Go even faster with a data file of account names.

##### github-contexts.dat
To get started:
```
# cp github-contexts-template.dat github-contexts.dat
# nano github-contexts.dat
```

Then add your context tag, github username, and associated email address:
```
# github contexts data file
# format: "context-name","username","account-email-address"
#
# 230820 KBI created

"zerochill","zerochill","zerochill@proton.me"
"acidburn","acidburn","acidburn@myspace.com"
```
Save it and now you can switch contexts (accounts), load ssh keys, and test the ssh key in one quick command:
```
# setgithubcontext zerochill
```

