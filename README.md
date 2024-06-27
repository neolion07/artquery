# About

This program consists of a bundle of Lua scripts that provide simple operations
for a PostgreSQL database (model can be found <a href="ERD.png">here</a>).

As for the program's features, it:

* creates the three tables from the model with some default values
* provides basic functions to query the database (SELECT)
* provides basic functions to maintain the database (INSERT, UPDATE and DELETE)

# Dependencies

Based on what was used to build this program:

* <a href="https://www.lua.org/">lua</a> >= 5.3
* <a href="https://luarocks.org">luarocks</a> >= 3.11
* <a href="https://lunarmodules.github.io/luasql/">luasql-postgres</a> >= 2.6.0 (available as a module for LuaRocks)
* <a href="https://www.postgresql.org">postgresql</a> >= 16.3

# How to use

**These instructions assume you're running a GNU/Linux environment.**

1. Start the PostgreSQL CLI and create a new role:
~~~bash
$ sudo -u postgres psql postgres
~~~
~~~
postgres=# CREATE ROLE user LOGIN PASSWORD 'password';
~~~

2. Create a database:
~~~
postgres=# CREATE DATABASE db WITH OWNER user;
~~~

3. Get the hostname and port for the database server. If it's running
locally, the hostname should be `localhost`. You can retrieve the port with:
~~~bash
$ netstat -l | grep PGSQL
~~~
* Output:
~~~bash
unix  2      [ ACC ]     STREAM     LISTENING     12345    /var/run/postgresql/.s.PGSQL.5432  # Port is 5432
~~~

4. Rename the `.env.template` file to just `.env` and remove placeholder
values in favor of the real values obtained in the previous steps.

6. To run the program, call the Lua interpreter from the `/scripts`
directory of this project:
~~~bash
$ lua main.lua
~~~
