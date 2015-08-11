Permissions
===========

What permissions do we need to consider, and how to implement them?

Users vs Groups
---------------

Different APIs will have different concept of users. The SIF 3 REST API has
users which then create an environment. That environment has a default and
optional zones. The zones in this case can be used as the Group or permission
set.

Permissions
-----------

For simplicity we are going t create Permissions Groups. In a
Directory/Unix/LDAP approach this would be like a user group (e.g. Admin or
Staff) which can then restrict what that user can do or see. We are going to
call these permission groups (or perm for short) to allow arbitrary grouping of
these permissions. This means we could actually assign multiple permissions to
a single group or user.

Optional Membership
-------------------

How do we go about adding a school, or a subset of a school to another
service. In simplest form this would be a princpal at a school adding the whole
school, specific groups (teaching groups, or classes), or specific users to a
service such as Mathletics.


