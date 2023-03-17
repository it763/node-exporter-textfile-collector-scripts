#!/bin/sh
#
# Expose md5 hashsum of files, passed as an argument.
#
# Usage: add this to crontab:
#
# */5 * * * * prometheus md5-hashsum.sh /var/lib/prometheus | sponge /var/lib/node_exporter/md5-hashsum.prom
#
# 
echo "# HELP crc32 sum CRC32 sum of folder"
echo "# TYPE crc32_sum_folder gauge"

echo "crc32_directory_sum `find "$@"  -type f -exec cksum {} \; | sort -k 2 | cksum |  sed 's/ //'`"
