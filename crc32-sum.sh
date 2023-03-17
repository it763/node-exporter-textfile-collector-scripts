#!/bin/sh
#
# Expose md5 hashsum of files, passed as an argument.
#
# Usage: add this to crontab:
#
# */5 * * * * prometheus md5-hashsum.sh /var/lib/prometheus | sponge /var/lib/node_exporter/md5-hashsum.prom
#
# 
echo "# HELP crc32 sum CRC32 sum of file"
echo "# TYPE crc32_sum gauge"
cksum "$@" | sed 's/ //' | sed 's/\(.*\) \(.*\)/crc32_sum{file="\2"} \1/'
