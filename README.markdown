# packages

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with packages](#setup)
    * [What packages affects](#what-packages-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with packages](#beginning-with-packages)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Simple module to manage packages, but highly flexible.

## Setup

### Beginning with packages

Follow [this page](https://docs.puppet.com/puppet/latest/reference/lookup_quick_module.html) to setup your puppet server for data in modules.

Depending on how your setup is, you can now use:

`include '::packages'` 

from anywhere.

```puppet
class { '::packages':
  users => { ... },
}
```
from profile and roles.

Or add the class 'apckages' to you 'classes' array, if you use
```puppet
hiera_include('packages')
```

Specifying packages will be done in hiera. An example:
```puppet
packages::packages:
  zip:
    ensure : 'latest'
  unzip:
    ensure : 'absent'
  bundler:
    ensure : 'latest'
    provider : 'gem'
```
This will keep the latest version of zip installed, keep unzip absent and will install the bundler gem.

##Usage

All interaction with the packages module can be done through the main packages class. This means you can simply toggle the options in `::packages` to have full functionality of the module.
