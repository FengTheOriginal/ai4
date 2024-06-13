#!/bin/bash

# User details
USERNAME="testuser01"
GROUP="testuser"
HOMEDIR="/home/$USERNAME"
SOURCE_DIR="/home/testuser"
FILES=("startup.py" "server.py")
PASSWORD="testuser01"
ASCII_ART="
...................::::::::::::::..................
..............::-=::-::----------+-:...............
...........::=:::::::::::::::--------+::...........
.........:=:::::::::::::::::::::--------*:.........
.......:=::::::::::::::::::::::::::-------+:.......
.....::::::::::::::::::::::::::::::::--------......
....:=:::::::::::::::::::::::::::::::::------*:....
....-:::::::::::@@@@-:::::::::-@@@@::::::-----+::..
..:=:::::::::::@@@@@@:::::::::@@@@@@::::::-----+:..
..=::::::::::::@@@@@@:::::::::@@@@@@:::::::-----+..
.::::::::::::::*@@@@@:::::::::@@@@@#::::::::-----::
:-::::::::::::::*@@@::::::::::-@@@#:::::::::------:
:+-::::::::::::::::::::::::::::::::::::::::::----+:
::-::::::::::::::::::::::::::::::::::::::::::-----:
:---:::::::::::::::::::::::::::::::::::::::::-----:
:+--::::::::::::::::::::::::::::::::::-::::::----+:
:----::::::-+:::::::::::::::::::::::::=-::::------:
::----:--*@%:::::::::::::::::::::::::::%@*-:-----::
..+-----:::*@:::::::::::::::::::::::::@*:-------+..
..:+-----:::-@=:::::::::::::::::::::=@-:::-----+:..
....=-----::::%@%:::::::::::::::::%@%:::------=.:..
....:*------::--=@@@=--:::::-:+@@@-::::------*:....
.....::-------::::::*@@@@@@@@@*::::::--------......
.......:*--------::::::::::::::::---------*::......
.........:*-----------------------------*:::.......
...........::+-----------------------+::...........
..............::-+---------------+-:::.............
..................:::::::::::::::..................
"
# Delete the user and their home directory
sudo userdel -r "$USERNAME"

# Recreate the user and their home directory
sudo useradd -m -d "$HOMEDIR" "$USERNAME"
echo "$USERNAME:$PASSWORD" | sudo chpasswd
# Ensure correct permissions for the home directory
sudo chmod 755 "$HOMEDIR"

# Copy instructions.txt to the user's home directory
sudo cp "$SOURCE_DIR/instructions2.txt" "$HOMEDIR"
#Adding ASCII ART :)
echo "$ASCII_ART" | sudo tee -a "$HOMEDIR"/.bashrc > /dev/null
# Create and configure .bashrc
sudo touch "$HOMEDIR"/.bashrc
sudo chown "$USERNAME":"$USERNAME" "$HOMEDIR"/.bashrc
sudo chmod u+rx "$HOMEDIR"/.bashrc
echo 'export PATH=$PATH:/new/path' | sudo tee -a "$HOMEDIR"/.bashrc > /dev/null

# Create and configure .bash_profile
sudo touch "$HOMEDIR"/.bash_profile
sudo chown "$USERNAME":"$USERNAME" "$HOMEDIR"/.bash_profile
sudo chmod u+x "$HOMEDIR"/.bash_profile
echo 'export PATH=$PATH:/another/path' | sudo tee -a "$HOMEDIR"/.bash_profile > /dev/null

# Ensure history is cleared and saved properly in .bash_profile
echo 'history -c; history -w' | sudo tee -a "$HOMEDIR"/.bash_profile > /dev/null

# Copy the Python files to the user's home directory
for file in "${FILES[@]}"; do
    sudo cp "$SOURCE_DIR/$file" "$HOMEDIR"
    sudo chmod u+rx "$HOMEDIR/$file"
    sudo chmod u-w "$HOMEDIR/$file"
    sudo chown "$USERNAME":"$GROUP" "$HOMEDIR/$file"
done

# Run nohup on the startup.py file as the new user
sudo -u "$USERNAME" nohup python3 "$HOMEDIR/startup.py" &

echo "Script execution completed."
