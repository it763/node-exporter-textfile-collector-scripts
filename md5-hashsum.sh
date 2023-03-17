#!/bin/sh
#
# Expose md5 hashsum of files, passed as an argument.
#
# Usage: add this to crontab:
#
# */5 * * * * prometheus md5-hashsum.sh /var/lib/prometheus | sponge /var/lib/node_exporter/md5-hashsum.prom
#
# 
echo "# HELP md5_hashsum MD5 hashsum of file"
echo "# TYPE md5_hashsum gauge"
md5sum "$@" | sed 's/\(.*\) \(.*\)/md5_hashsum{file="\2"} \1/'
