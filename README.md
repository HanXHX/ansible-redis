Redis Ansible
=============

[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-HanXHX.redis-blue.svg)](https://galaxy.ansible.com/HanXHX/redis) [![Build Status](https://app.travis-ci.com/HanXHX/ansible-redis.svg?branch=master)](https://app.travis-ci.com/HanXHX/ansible-redis)

Install and configure [Redis](http://redis.io/). Manage replication.

Managed OS
----------

|     OS Release       |        Status      |
|:--------------------:|:------------------:|
| Debian Stretch (9)   | :heavy_check_mark: |
| Debian Buster (10)   | :heavy_check_mark: |
| Debian Bullseye (11) | :heavy_check_mark: |


Requirements
------------

- If you want to install Redis from backports, you must use add this repository.
- If redis is already installed by hand (or other process). Please uninstall and purge configuration files. This role uses default config file and overwrite config in another file.

Role Variables
--------------

- Default config file is defined in [default vars](defaults/main.yml).
- `redis_apt_backports`: set true to install Redis from backports (default is false).
- `redis_ulimit`: manage ulimit in startup script
- `redis_apt_target`: target used by apt module. DO NOT EDIT! You must edit `redis_apt_backports`

Dependencies
------------

None.

Example Playbook
----------------

### Simple

    - hosts: servers
      roles:
         - { role: HanXHX.redis }

### Redis from Backports

    - hosts: servers
      pre_tasks:
         - apt_repository: repo='deb http://httpredir.debian.net/debian {{ ansible_distribution_release }}-backports main' state=present
      roles:
         - { role: HanXHX.redis, redis_apt_backports: true }

License
-------

GPLv2

Donation
--------

If this code helped you, or if you’ve used them for your projects, feel free to buy me some :beers:

- Bitcoin: `1BQwhBeszzWbUTyK4aUyq3SRg7rBSHcEQn`
- Ethereum: `0x63abe6b2648fd892816d87a31e3d9d4365a737b5`
- Litecoin: `LeNDw34zQLX84VvhCGADNvHMEgb5QyFXyD`
- Monero: `45wbf7VdQAZS5EWUrPhen7Wo4hy7Pa7c7ZBdaWQSRowtd3CZ5vpVw5nTPphTuqVQrnYZC72FXDYyfP31uJmfSQ6qRXFy3bQ`

No crypto-currency? :star: the project is also a way of saying thank you! :sunglasses:

Author Information
------------------

- Twitter: [@hanxhx_](https://twitter.com/hanxhx_)
- All issues, pull-requests are welcome :)
