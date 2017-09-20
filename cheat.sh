#!/bin/bash
# Author https://github.com/grigruss

# Check translate-shell script
if [[ ! $(trans -V) ]]
then
        echo -e "\n\e[33mWARNING!\n========\e[0m"
        echo -e "To run the script, you need a 'trans' script from this repository:"
        echo -e "https://github.com/soimort/translate-shell/releases\n"
        exit 1
fi

# Check curl
if [[ ! $(curl -V) ]]
then
        echo -e "\n\e[33mWARNING!\n========\e[0m"
        echo -e "To run the script, you need install 'curl'"
        exit 1
fi

lang=$(locale | grep -i lang)
lang="${lang:5:2}"

curl "cheat.sh/$1" | while read -r src; do
        if [[ ${src:11:1} == "#" ]]
        then
                flag="no"
                srclen=${#src}
                srclen=(srclen - 17)
                echo "${src:0:11} # [en] ${src:13:srclen}"
                trans "${src:13:srclen}" | while read -r answ; do
                        fullanswlen="${#answ}"
                        if [[ $fullanswlen -eq 0 ]]
                        then
                                flag="yes"
                        elif [[ $flag == "yes" ]]
                        then
                                answlen=(fullanswlen - 15)
                                echo "${src:0:11} # [$lang] ${answ:4:answlen}"
                                break
                        fi
                done
        else
                echo "$src"
        fi
done
