#!/bin/bash

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"

PHP_ROOT=/srv/http/php

# Must run setup as root since we are copying to a root network directory
if [[ $(id -u) -ne 0 ]] ; then echo "Please run the php setup script as root." ; exit 1 ; fi

for phpserver in `find . -name "setup-php.sh"`
do
    directory=$(dirname $phpserver)
    problem_name=${phpserver%/*/*}
    problem_name=${problem_name/.\//}
    problem_name=${problem_name%_*}
    while read line
    do
        mkdir -p $PHP_ROOT/$problem_name
        cp $directory/$line $PHP_ROOT/$problem_name/$line
    done < $directory/setup-php.sh
    printf "${GREEN}Deploying $problem_name....${RESET}\n"
done
