#!/bin/bash
# Apple Valid Email Checker
# Valid 2019 apel!

HIJAU='\033[0;32m'
MERAH='\033[01;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'

vApEL(){
	nowy=$(date +'%r')
	x=$(curl -s "http://iyhofficial.site/cSuhadi/?email=${eMailna}&limit=${sending}" &)
	if [[ $x =~ '<status>LIVE</status>' ]]; then
   		printf "[+ aPelCJa +] [$i/$AllTotal] LIVE = > ${HIJAU} $eMailna ${NORMAL} [ $nowy ]"
   		echo""
   		echo "$eMailna" >> live-result-apple.txt
   	else
   		printf "[+ aPelCJa +] [$i/$AllTotal] DEAD = > ${MERAH} $eMailna ${NORMAL} [ $nowy ]"
   		echo""
   	fi
}
printf ${MERAH}
echo " _______  _______  _______  _        _______ _________ _______ "
echo "(  ___  )(  ____ )(  ____ \( \      (  ____ \\__    _/(  ___  )"
echo "| (   ) || (    )|| (    \/| (      | (    \/   )  (  | (   ) |"
echo "| (___) || (____)|| (__    | |      | |         |  |  | (___) |"
echo "|  ___  ||  _____)|  __)   | |      | |         |  |  |  ___  |"
printf ${PUTIH}
echo "| (   ) || (      | (      | |      | |         |  |  | (   ) |"
echo "| )   ( || )      | (____/\| (____/\| (____/\|\_)  )  | )   ( |"
echo "|/     \||/       (_______/(_______/(_______/(____/   |/     \|"
printf ${CYAN}
echo "Apple Valid Email Checker - 2019"
printf ${NORMAL}
read -p " Your List Email : " list
read -p " Send Per List(20|60): " sending
read -p " Delay(0.90|2|5|8): " waktudelay
if [[ $sending < 61 ]]; then
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
 
