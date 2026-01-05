#! /bin/bash

NARGS=1

if [ $# -ge  $NARGS ]
then
    if [ $1 = "-c" ]
    then
        echo '[INFO] Cleaning...'
        alr clean
    fi
fi

echo '[INFO] Building...'
touch compile.log
alr build > compile.log

cat compile.log | grep Success

exit $?