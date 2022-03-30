#!/bin/sh

sqlite3 test.db 'create table if not exists n (galaxy_version TEXT,flavor_name TEXT,version INTEGER);'

latest_package_version=$(sqlite3 test.db "select max(version) from n where galaxy_version='$1' and flavor_name='$2';")

echo $latest_package_version 

new_version=$(($latest_package_version + 1))
echo $new_version
sqlite3 test.db "insert into n (galaxy_version, flavor_name, version) values ('$1','$2','$new_version');"
sqlite3 test.db "select * from n;"
