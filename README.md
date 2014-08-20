pg-prove pgtap test runner container
===============

A [Docker](https://www.docker.com/) image that execute pg_prove to test a
a folder of [pgTAP](http://www.pgtap.org) tests within a specific database.

# How to use

Run your database in a container. This might be changed in the future to work on
local databases.

`docker run --rm -v /database/test/:/test --link database-container:db digit/pg-prove -h db -p 5432 -u username -w password -d database -t '/test/*.sql'`

We use the following [docker's run parameters](https://docs.docker.com/reference/commandline/cli/#run):

`--rm`    to remove the container when it stops. No reason for it to stick around
`-v`      to map the [Docker](https://www.docker.com/) tests into the container
so it can run the tests
`--link`  to link the database that you are testing to be locally available to
the container as 'db'.

## Running Tests

When the container begins it will install [pgTAP](http://www.pgtap.org) into
the target database.

After running the tests it will uninstall [pgTAP](http://www.pgtap.org),
leaving the database squeaky clean.

It is advisable to have tests run in a [transaction (BEGIN and ROLLBACK block)](http://pgtap.org/documentation.html#pgtaptestscripts) however you do not
need to load the pgtap.sql file, as this is taken care of by the `test.sh` script.
## License

Just MIT, Copyright (c) 2014 DreamItGetIT, read LICENSE file for more
information.

