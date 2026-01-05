#! /bin/bash

if [ -d 'bin' ]
then
    alr exec -- arm-eabi-objcopy -Obinary bin/hello_world bin/hello_world.bin
    st-flash --connect-under-reset write bin/hello_world.bin 0x08000000
else
    echo "[ERROR] Bin folder doesn't exist!"
    exit 1
fi

exit $?