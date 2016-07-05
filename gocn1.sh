#!/bin/sh
HOSTNAME=$1
HOSTNO=$2

function help()
{
  echo "**********************************Usage***************************************"                           
  echo "                ./gocn1.sh 1 1 connnect a server 10";
  echo "                                                                                                ";
  echo "1.  a     l-a[121-180,300].f.cn1 ";
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
