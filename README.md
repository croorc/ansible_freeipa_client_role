Role Name
=========

Wrapper for role to install freeipa client on Ubuntu 20.04 due to error: Module ipapython.version not found error

Requirements
------------

This role requires DNS discovery set up for the ipa client

Role Variables
--------------

This role uses the same variables as the freeipa.ansible_freeipa.ipaclient role.

Dependencies
------------

freeipa.ansible_freeipa.ipaclient

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
 
    vars:
      ipaadmin_principal: admin
      ipaadmin_password: xxxx
      ipaclient_domain: domain.com
      ipaclient_realm: DOMAIN.COM
    roles:
    - role: freeipa_role

License
-------

MIT

Author Information
------------------

Ryan Lavelle
