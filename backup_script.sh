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

