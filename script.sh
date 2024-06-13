#!/bin/bash

sudo userdel -rf bushranger999  # Remove existing user if needed
sudo groupdel bushranger999     # Remove existing group if needed

sudo useradd -m -d /home/bushranger999 -s /bin/bash bushranger999
echo "bushranger999:bushranger999" | sudo chpasswd

sudo mkdir -p /home/bushranger999  # Create home directory if it doesn't exist
sudo chown -R bushranger999:bushranger999 /home/bushranger999
sudo chmod 755 /home/bushranger999  # Ensure correct permissions for home directory
sudo cp /home/testuser/instructions.txt /home/bushranger999 
# Create and configure .bashrc
sudo touch /home/bushranger999/.bashrc
sudo chown bushranger999:bushranger999 /home/bushranger999/.bashrc
echo "export PATH=\$PATH:/new/path" | sudo tee -a /home/bushranger999/.bashrc > /dev/null

# Create and configure .bash_profile
sudo touch /home/bushranger999/.bash_profile
sudo chown bushranger999:bushranger999 /home/bushranger999/.bash_profile
echo "export PATH=\$PATH:/another/path" | sudo tee -a /home/bushranger999/.bash_profile > /dev/null

# Ensure history is cleared and saved properly in .bash_profile
echo "history -c; history -w" | sudo tee -a /home/bushranger999/.bash_profile > /dev/null

#rm -rf images/*
# Define source and destination file paths
SOURCE_FILE="image.jpg"
DESTINATION_DIR="/home/bushranger999/images"

# Create destination directory if it doesn't exist
sudo mkdir -p "$DESTINATION_DIR"

# Loop to copy the file 250 times
for (( i=1; i<=250; i++ ))
do
    # Generate a random 4-letter name
    RANDOM_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 4 | head -n 1)

    # Define destination file path
    DESTINATION_FILE="$DESTINATION_DIR/$RANDOM_NAME.jpg"

    # Copy the file with the random name
    sudo cp "$SOURCE_FILE" "$DESTINATION_FILE"

    # Check if this is the 117th file
    if [ "$i" -eq 117 ]; then
        # Create a text file with hidden information
        echo "This is a hidden message in the 117th file." > hidden_message.txt

        # Use steghide to embed the text file into the image
        sudo steghide embed -cf "$DESTINATION_FILE" -ef hidden_message.txt -p "password"

        # Check if steghide was successful
        if [ $? -ne 0 ]; then
            echo "Failed to embed the hidden message in the 117th file."
            exit 1
        fi

        echo "Hidden message embedded in the 117th file named $DESTINATION_FILE."
    fi
    sudo chmod u-w,o-r "$DESTINATION_FILE"
    sudo chgrp bushranger999 "$DESTINATION_FILE"
    echo "File $DESTINATION_FILE created."
done
echo "$DESTINATION_FILE"
