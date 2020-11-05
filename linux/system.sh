#!/bin/bash
duse='/backups/diskuse/disk_usage.txt'
olist='/backups/openlist/open_list.txt'
fdisk='/backups/freedisk/free_disk.txt'
fmem='/backups/freemem/free_mem.txt'

echo '\nSaving Disk Usage'
du 2>/dev/null > ~/backups/diskuse/disk_usage.txt
echo '\nSaving Open List'
lsof > ~/backups/openlist/open_list.txt
echo '\nSaving Free Disk '
df -h -x squashfs -x tmpfs --total > ~/backups/freedisk/free_disk.txt
echo '\nSaving Memory Useage '
free -mt > ~/backups/freemem/free_mem.txt