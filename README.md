Redis Ansible
=============

[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-HanXHX.redis-blue.svg)](https://galaxy.ansible.com/list#/roles/3989) [![Build Status](https://travis-ci.org/HanXHX/ansible-redis.svg)](https://travis-ci.org/HanXHX/ansible-redis)

Install and configure [Redis](http://redis.io/).

Requirements
------------

- Only Debian Wheezy or Jessie.
- If you want to install Redis from backports, you must use add this repository.

Role Variables
--------------

  - Default config file is defined in [default vars](defaults/main.yml). All config vars are prefixed with "redisconf\_".
  - redis\_apt\_backports: set true to install Redis from backports (default is false).
  - redis\_apt\_target: target used by apt module. DO NOT EDIT! You must edit redis\_apt\_backports

Dependencies
------------

None. But you can add explicitely my [Dotdeb role](https://galaxy.ansible.com/list#/roles/3970) to have the latest version of Redis!

Example Playbook
----------------

### Simple

    - hosts: servers
      roles:
         - { role: HanXHX.redis }

### Redis from Dotdeb

    - hosts: servers
      roles:
         - { role: HanXHX.dotdeb }
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

Author Information
------------------

  - You can find many other roles in my GitHub "lab": https://github.com/HanXHX/my-ansible-playbooks
  - All issues, pull-request are welcome :)
