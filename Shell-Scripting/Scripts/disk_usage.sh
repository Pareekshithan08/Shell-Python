#!/bin/bash

disk=$(df -h | awk 'NR>1 {print $5}' | sed 's/%//g')

for i in $disk; do
    if [[ $i -lt 30 ]]; then
        echo "Disk space is sufficient: ($i)% consumed" | mail -s "Disk Space Alert" pareekshithan08@gmail.com
    else
        echo "Warning: Low disk space! Only ($i)% consumed" | mail -s "Disk Space Alert" pareekshithan08@gmail.com
    fi

done