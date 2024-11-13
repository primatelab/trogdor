#!/usr/bin/env bash

##################################################
##   _____                    _            _    ##
##  |_   _| __ ___   __ _  __| | ___  _ __| |   ##
##    | || '__/ _ \ / _` |/ _` |/ _ \| '__| |   ##
##    | || | | (_) | (_| | (_| | (_) | |  |_|   ##
##    |_||_|  \___/ \__, |\__,_|\___/|_|  (_)   ##
##           T H E  |___/  B U R N I N A T O R  ##
##################################################

# This script runs multiple high CPU, high disk I/O processes

processes=32

tempdir=$(mktemp -d /tmp/XXXXXXXX )
touch $tempdir/TROGDORRR
marquee() {
  echo -en '\033[1;31m'
  for (( i = 0; i < ${#1}; i++ )); do
    echo -n ${1:$i:1}
    sleep 0.1
  done
  echo -en '\033[0m'
}

bye() {
  [[ -e $tempdir ]] && echo -e "\nBurnination ended."
  rm -rf $tempdir
  exit
}
trap bye SIGINT

function burninate () {
  mkdir -p $tempdir/$1
  block=$(mktemp "$tempdir/$1/blockXXX")
  dd bs=4096 count=4096 if=/dev/urandom of=$block 2> /dev/null
  while [[ -e "$tempdir/TROGDORRR" ]]; do
    cat $block | gzip -9 > "$block-out"
    mv -f "$block-out" $block
  done
  rm -rf $tempdir/$1
  # exit
}

echo -n "Press any key to end the "
marquee 'burnination.'
echo
for (( i = 0; i < $processes; i++ )); do burninate $i & done #| xargs -I% -P0 $0 XARGS-BURN "$tempdir/%"
read -rsn 1;
rm $tempdir/TROGDORRR
while [[ $(ls -1 $tempdir | wc -l) -gt 0 ]]; do
  sleep 0.1
done
rm -rf $tempdir
# bye

# BURNINATING THE CPU!!!
#      BURNINATING THE IO!!!
#                                                  :::
#                                             :: :::.
#                       \/,                    .:::::
#           \),          \`-._                 :::888
#           /\            \   `-.             ::88888
#          /  \            | .(                ::88
#         /,.  \           ; ( `              .:8888
#            ), \         / ;``               :::888
#           /_   \     __/_(_                  :88
#             `. ,`..-'      `-._    \  /      :8
#               )__ `.           `._ .\/.
#              /   `. `             `-._______m         _,
#  ,-=====-.-;'                 ,  ___________/ _,-_,'"`/__,-.
# C   =--   ;                   `.`._    V V V       -=-'"#==-._
#:,  \     ,|      UuUu _,......__   `-.__Ʌ_Ʌ_ -. ._ ,--._ ",`` `-
#||  |`---' :    uUuUu,'          `'--...____/   `" `".   `
#|`  :       \   UuUu:
#:  /         \   UuUu`-._
# \(_          `._  uUuUu `-.
# (_3             `._  uUu   `._
#                    ``-._      `.
#                         `-._    `.
#                             `.    \
#                               )   ;
#                              /   /
#               `.        |\ ,'   /
#                 ",_Ʌ_/\-| `   ,'
#                   `--..,_|_,-'\
#                          |     \
#                          |      \__
#                          |__
#
