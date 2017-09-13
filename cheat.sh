#!/bin/bash
# Author https://github.com/grigruss

# Check translate-shell script
if [[ ! `trans -V` ]]
then
        echo -e "\nWARNING!\n========"
        echo -e "To run the script, you need a 'trans' script from this repository:"
        echo -e "https://github.com/soimort/translate-shell/releases\n"
        exit 1
fi

# Check curl
if [[ ! `curl -V` ]]
then
        echo -e "\nWARNING!\n========"
        echo -e "To run the script, you need install 'curl'"
        exit 1
fi

lang=`locale | grep -i lang`
lang="${lang:5:2}"

curl cheat.sh/$1 | while read src; do
        if [[ ${src:11:1} == "#" ]]
        then
                flag="no"
                srclen=`expr length "$src"`
                srclen=`expr $srclen - 17`
                echo "${src:0:11} # [en] ${src:13:$srclen}"
                trans "${src:13:$srclen}" | while read answ; do
                        fullanswlen=`expr length "$answ"`
                        if [[ $fullanswlen -eq 0 ]]
                        then
                                flag="yes"
                        elif [[ $flag == "yes" ]]
                        then
                                answlen=`expr "$fullanswlen" - 15`
                                echo "${src:0:11} # [$lang] ${answ:4:$answlen}"
                                break
                        fi
                done
        else
                echo $src
        fi
done
