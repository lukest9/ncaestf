#!/bin/bash

# Define the group
GROUP="ftpusers"

# Create the group if it does not exist
if ! getent group "$GROUP" > /dev/null; then
    sudo groupadd "$GROUP"
    echo "Group '$GROUP' created."
else
    echo "Group '$GROUP' already exists."
fi

# List of users
USERS=(
    camille_jenatzy gaston_chasseloup leon_serpollet william_vanderbilt
    henri_fournier maurice_augieres arthur_duray henry_ford louis_rigolly
    pierre_caters paul_baras victor_hemery fred_marriott lydston_hornsted
    kenelm_guinness rene_thomas ernest_eldridge malcolm_campbell ray_keech
    john_cobb dorothy_levitt paula_murphy betty_skelton rachel_kushner
    kitty_oneil jessi_combs andy_green
)

# Add each user to the group
for user in "${USERS[@]}"; do
    if id "$user" &>/dev/null; then
        sudo usermod -aG "$GROUP" "$user"
        echo "User '$user' added to group '$GROUP'."
    else
        echo "User '$user' does not exist. Skipping."
    fi
done

# Change the group ownership of /mnt/files
if [ -d "/mnt/files" ]; then
    sudo chown :$GROUP /mnt/files
    sudo chmod 770 /mnt/files  # Full access for owner and group, none for others
    echo "/mnt/files permissions updated."
else
    echo "/mnt/files directory does not exist."
fi

echo "All operations completed."
