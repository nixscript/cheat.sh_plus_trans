#!/bin/bash
# Author https://github.com/grigruss

# Check translate-shell script
if [[ ! $(trans -V) ]]
then
        echo -e "\\n\\e[33mWARNING!\\n========\\e[0m"
        echo -e "To run the script, you need a 'trans' script from this repository:"
        echo -e "https://github.com/soimort/translate-shell/releases\\n"
        exit 1
fi

# Check curl
if [[ ! $(curl -V) ]]
then
        echo -e "\\n\\e[33mWARNING!\\n========\\e[0m"
        echo -e "To run the script, you need install 'curl'"
        exit 1
fi

lang=$(locale | grep -i lang)
lang="${lang:5:2}"

curl "cheat.sh/$1" | while read -r src; do
        if [[ ${src:11:1} == "#" ]]
        then
#                flag="no"
                enString=${src#*\#}
                enString=${enString%[*}
                echo -e "\\e[30;1m# [en]$enString[0m"
                IFS=$'\n'
                count=0
                for answ in $(trans "$enString"); do
                        if [ $count == 1 ]; then
                                echo -e "\\e[32;1m# [ru] $answ\\e[0m"
                        fi
                        count=$((count + 1))
                done
        else
                echo "$src"
        fi
done
