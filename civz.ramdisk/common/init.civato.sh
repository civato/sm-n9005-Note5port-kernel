#!/system/bin/sh

# selinux fixups
/system/xbin/supolicy --live "allow mediaserver mediaserver_tmpfs file execute"

/sbin/setonboot apply &
/system/xbin/busybox run-parts /system/etc/init.d &
