#!/bin/bash

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"

for phpserver in `find . -name "setup-php.sh"`
do
    directory=$(dirname $phpserver)
    problem_name=${phpserver%/*/*}
    problem_name=${problem_name/.\//}
    while read line
    do
        sudo mkdir -p /srv/http/php/$problem_name
        sudo cp $directory/$line /srv/http/php/$problem_name/$line
    done < $directory/setup-php.sh
    printf "${GREEN}Deploying $problem_name....${RESET}\n"
done
