# Detect operating system

UNAME=`uname`

if [[ $UNAME == 'Linux' ]]; then
    IS_LINUX=1
elif [[ $UNAME == 'DARWIN' ]]; then
    IS_DARWIN=1
fi

export IS_LINUX
export IS_DARWIN
