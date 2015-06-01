#!/bin/bash
#
# plv8 sur Centos 

# http://adpgtech.blogspot.de/2013/03/loading-useful-modules-in-plv8.html
# http://stackoverflow.com/questions/25433445/plv8-stored-procedure-with-jsonb-type/25438305#25438305

# https://github.com/bruth/jsonpatch-js
# https://codeload.github.com/bruth/jsonpatch-js/zip/master
# unzip jsonpatch-js-master.zip

# add
#
#    plv8.start_proc = 'plv8_startup'
#
# in postgresql.conf file, then restart.


DBNAME=testplv8
psql -Upostgres <<EOF
drop database $DBNAME;
create database $DBNAME;
\c $DBNAME
create extension plv8;
create extension plv8_modules;
create extension pg_jsonpatch;

EOF

psql -U postgres -v jsonpatch="`cat ../../jsonpatch-js-master/jsonpatch.js`" -1 -f pg_jsonpatch_load.sql $DBNAME

psql -U postgres -f ../test/jsonpatch_test.sql  $DBNAME
