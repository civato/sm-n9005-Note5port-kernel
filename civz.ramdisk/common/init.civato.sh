#!/system/bin/sh

# selinux fixups
/system/xbin/supolicy --live "allow mediaserver mediaserver_tmpfs file execute"

DDIR=/data/data/civato

# kernel custom test

if [ -e /data/Kerneltest.log ]; then
rm /data/Kerneltest.log
fi

echo  Kernel script is working !!! >> /data/Kerneltest.log
echo "excecuted on $(date +"%d-%m-%Y %r" )" >> /data/Kerneltest.log

# system install SuperSU
#
CFILE=$DDIR/supersu
SFILE=/data/.supersu
CDEF="SYSTEMLESS=false"
if [ ! -f $CFILE ]; then
	echo $CDEF > $CFILE
fi
echo `cat $CFILE` > $SFILE

#
# Init.d
#
if [ ! -d /system/etc/init.d ]; then
	mkdir -p /system/etc/init.d/;
	chown -R root.root /system/etc/init.d;
	chmod 777 /system/etc/init.d/;
	chmod 777 /system/etc/init.d/*;
fi;

/sbin/setonboot apply &
/system/xbin/busybox run-parts /system/etc/init.d &
