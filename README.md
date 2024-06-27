# About

This program consists of a bundle of Lua scripts that provide simple operations
for a PostgreSQL database (model can be found <a href="ERD.png">here</a>).

As for the program's features, it:

* creates the three tables in the model and feeds them data from the
<a href="https://api.artic.edu/docs">Art Institute of Chicago's public API</a>
* provides basic functions to query the database (SELECT)
* provides basic functions to maintain the database (INSERT, UPDATE and DELETE)

# Dependencies

Based on what was used to build this project:

* <a href="https://www.lua.org/">lua</a> >= 5.3
* <a href="https://luarocks.org">luarocks</a> >= 3.11
* <a href="https://lunarmodules.github.io/luasocket">luasocket</a> >= 3.1.0
* <a href="https://github.com/lunarmodules/luasec">luasec</a> >= 1.3.2
* <a href="https://lunarmodules.github.io/luasql">luasql-postgres</a> >= 2.6.0 (available as a module for LuaRocks)
* <a href="https://www.postgresql.org">postgresql</a> >= 16.3

This project also makes use of the <a href="https://github.com/rxi/json.lua">json.lua</a> module and is included in the `/scripts` directory.

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
