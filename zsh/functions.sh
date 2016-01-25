# Misc functions

# mkdir, then cd
mcd()
{
    if [ ${1} ]
    then
    mkdir ${1}
    cd ${1}
    fi
}

