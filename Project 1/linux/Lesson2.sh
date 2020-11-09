#!/bin/bash

output=$HOME/research/sys_info.txt

ip=$(ip addr | grep inet | head -9 | tail -1)
echo $ip