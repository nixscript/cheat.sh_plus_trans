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

T=0
while [ -n "$1" ]
do
	case "$1" in
		-T) T=1;;
		*) U="$1"; break;;
	esac
	shift
done

src=$(curl "cht.sh/${U}?T")
IFS=$'\n'
S=''
for answ in $src
do
	if [[ "${answ:0:1}" == "#" ]]
	then
		S+="
$answ"
	fi
done
res=$(trans -b "$S")
R=''
C=0
IFS=$'\n'
for row in $res
do
	R[$C]="$row"
	((C++))
done

count=0
IFS=$'\n'
for answ in $src
do
	if [[ "${answ:0:1}" == "#" ]]
	then
		VR="${R["$count"]//#/# \[ru\]}"
		VE="${answ//#/# \[en\]}"
		if [[ "$T" == 0 ]]
		then
			echo -e "\e[32;1m$VR\e[0m\n\e[32m$VE\e[0m"
		else
			echo -e "$VR\n$VE"
		fi
		((count++))
	else
		echo "$answ"
		echo
	fi
done
