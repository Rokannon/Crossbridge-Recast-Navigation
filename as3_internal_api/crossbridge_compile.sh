#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FLASCC="/cygdrive/c/Crossbridge_1.0.1/sdk"
CFLAGS="-Werror -Wno-write-strings -Wno-trigraphs -jvmopt=-Xmx1G"

echo Compiling...
"${FLASCC}/usr/bin/g++" ${CFLAGS} -O4 "${DIR}/main.cpp" -emit-swc=recastnavigation -o "${DIR}/as3_internal_api.swc"