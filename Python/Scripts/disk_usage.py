import os

def check_disk_usage(threshold=30):
    
    disk_usage = os.popen("df -h | awk 'NR>1 {print $5}' | sed 's/%//g' ").read().strip().split()
    
    for usage in disk_usage:
        usage_percent = int(usage)  
        if usage_percent > threshold:
            os.system(f'echo "Warning: Disk usage is high! ({usage}) consumed" | mail -s "Disk Space Alert" pareekshithan08@gmail.com' )


check_disk_usage()