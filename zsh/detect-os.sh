# Detect operating system

if [[ `uname` == 'Linux' ]]
then
    export IS_LINUX=1
else
    export IS_LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
        export IS_DARWIN=1
else
        export IS_DARWIN=
fi

