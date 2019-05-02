#!/bin/bash
# Email Validator 
# valid v2 Apel 2019 !

HIJAU='\033[0;32m'
MERAH='\033[01;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'

vApEL(){
	nowy=$(date +'%r')
	x=$(curl -s curl 'https://www.ultratools.com/tools/emailTestResult' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.ultratools.com/tools/emailTestResult' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data "emailOrDomain=${eMailna}" &)
	if [[ $x =~ 'Success' ]]; then
		country=$(curl -s curl 'https://www.ultratools.com/tools/emailTestResult' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.ultratools.com/tools/emailTestResult' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data "emailOrDomain=${eMailna}" | sed ':a;N;$!ba;s/\n/ /g' | tr -d ' ' | grep -Po '(?<=ipAddress)[^)]*' | cut -d '(' -f 2 | head -1)
   		printf "[+ eValidator +] [$i/$AllTotal] LIVE = > ${HIJAU} $eMailna [$country]${NORMAL}[ $nowy ]"
   		echo""
   		echo "$eMailna | $country " >> live-result.txt
   	elif [[ $x =~ 'RCPT TO failed' ]]; then
   		printf "[+ eValidator +] [$i/$AllTotal] DEAD = > ${MERAH} $eMailna ${NORMAL}[ $nowy ]"
   		echo""
   	else
   		printf "[+ eValidator +] [$i/$AllTotal] DEAD = > ${MERAH} $eMailna ${NORMAL}[ $nowy ]"
   		echo""
   	fi
}
printf ${MERAH}
echo " _______           _______  _       _________ ______   _______ _________ _______  _______ "
echo "(  ____ \|\     /|(  ___  )( \      \__   __/(  __  \ (  ___  )\__   __/(  ___  )(  ____ )"
echo "| (    \/| )   ( || (   ) || (         ) (   | (  \  )| (   ) |   ) (   | (   ) || (    )|"
echo "| (__    | |   | || (___) || |         | |   | |   ) || (___) |   | |   | |   | || (____)|"
printf ${PUTIH}
echo "|  __)   ( (   ) )|  ___  || |         | |   | |   | ||  ___  |   | |   | |   | ||     __)"
echo "| (       \ \_/ / | (   ) || |         | |   | |   ) || (   ) |   | |   | |   | || (\ (   "
echo "| (____/\  \   /  | )   ( || (____/\___) (___| (__/  )| )   ( |   | |   | (___) || ) \ \__"
echo "(_______/   \_/   |/     \|(_______/\_______/(______/ |/     \|   )_(   (_______)|/   \__/"
printf ${CYAN}
echo "Email Validator Checker + Detect Country - 2019"
printf ${NORMAL}
read -p " Your List Email : " list
read -p " Send Per List(10|30): " sending
read -p " Delay(0.90|2|5|8): " waktudelay
if [[ $sending < 31 ]]; then
	AllTotal=$(cat $list | wc -l)
	sendCek="$sending"
	delay="$waktudelay"
	memulai=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $list))'
	for (( i = 0; i <"${#list[@]}"; i++ )); do
	  eMailna="${list[$i]}"
	  cEkSend=$(expr $memulai % $sendCek)
	  if [[ $cEkSend == 0 && $memulai > 0 ]]; then
	    sleep $delay
	  fi
	  vApEL &
	    memulai=$[$memulai+1]
	done
	wait
else
	echo "Kelewatan lo"
	exit
fi
