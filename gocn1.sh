#!/bin/sh
HOSTNAME=$1
HOSTNO=$2

function help()
{
  echo "**********************************Usage***************************************"                           
  echo "                ./gocn1.sh 1 10 connnect twella server 10";
  echo "                                                                                                ";
  echo "1.  twella     l-tw[121-180,300].f.cn1 ";
  echo "2.  twellb     l-twb[16-20].f.cn1 ";
  echo "3.  wbd        l-wbd[16-80].f.cn1 ";
  echo "4.  api4       l-tw4.f.cn1 ";
  echo "5.  api        l-twapi[1-12].f.cn1 ";
  echo "6.  interMulti l-union[26-50].f.cn1"  
  echo "7.  tconfig    l-tconfig[1-6].f.cn1"
  echo "8.  bookfb     l-bkfb[1-2].f.cn1"
  echo "9.  booksystem l-book[1-4].f.cn1"
  echo "                                                                                                ";
  echo "******************************************************************************"
}

if [ -z "$HOSTNAME" ]; then 
    help;
	exit;
fi
if [ -z "$HOSTNO" ]; then 
    help;
fi

if [ "$HOSTNAME" = "1" ]; then
	ssh l-tw$HOSTNO.f.cn1;
fi

if [ "$HOSTNAME" = "2" ]; then
	ssh l-twb$HOSTNO.f.cn1;
fi

if [ "$HOSTNAME" = "3" ]; then
	ssh l-wbd$HOSTNO.f.cn1;
fi

if [ "$HOSTNAME" = "4" ]; then
	ssh l-tw$HOSTNO.f.cn1;
fi

if [ "$HOSTNAME" = "5" ]; then
	ssh l-twapi$HOSTNO.f.cn1;
fi

if [ "$HOSTNAME" = "6" ]; then
    ssh l-union$HOSTNO.f.cn1
fi

if [ "$HOSTNAME" = "7" ]; then
    ssh l-tconfig$HOSTNO.f.cn1
fi

if [ "$HOSTNAME" = "8" ]; then
    ssh l-bkfb$HOSTNO.f.cn1
fi

if [ "$HOSTNAME" = "9" ]; then
    ssh l-book$HOSTNO.f.cn1
fi
