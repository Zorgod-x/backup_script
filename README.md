# backup_script
Small script that automates the process of taking backups from a local machine to a remote server using rsync.

The script :
```
#!/bin/bash
# Automating backups by Nikolas Fedor
# Created 9/18/2023

# User-defines variables
backup_source="/path/to/source/directory"	# To modify
backup_destination="user@remote-server:/path/to/destination/directory"	# To modify
backup_name="backup_$(date +'%Y-%m-%d-%H:%M')"  # Backup folder name with time

	#Example :
#backup_source="/home/oem/Downloads" 				# Source destination to be backed up
#backup_destination="mike@10.0.0.212:/home/mike/backup" 	# Destination directory for backups


# Function to perform the backup
perform_backup() {

	# Check if the source directory exists
	if [ ! -d "$backup_source" ]; then
		echo "Source directory '$backup_source' does not exist. Exiting.."
		exit 1
	fi

	# Create the backup folder with a timestamp
	backup_folder="$backup_destination/$backup_name"

	echo "Backup started.."
	# Copy files and directories to the backup folder
	rsync -azv "$backup_source" "$backup_destination/$backup_name"
	echo "Backup completed successfully."
}

# Main script execution
perform_backup
```


output on client :

![backup1](https://github.com/Zorgod-x/backup_script/assets/99272119/83607fe2-378c-4f33-ac5d-2d5000723b7b)

![succes](https://github.com/Zorgod-x/backup_script/assets/99272119/b9401747-ce88-43c1-8b72-328ed3bb126c)

output on server :

![backup_server](https://github.com/Zorgod-x/backup_script/assets/99272119/b2139c4e-c284-490f-8ee5-d061731508e9)


##FAQ;

Q: How can I make backups automatic?

A: You can use crontab (on linux) link

Q: Why can't I start the script?

A: Make the file executable (chmod +x backup_script.sh)

Q: Will this work on all linux distros?

A: This script was tested on Ubuntu 12/14,Debian and Centos 6 and has worked whitout any problems
