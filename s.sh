#!/bin/bash

# Define the password hash
HASH='$6$KHk2hJlrIZKWxWA9$z2OrpVg05wxoUp/BL12VY9rvxvgyZhta.qKf9SwckeNMcW4QvCJACSA4QyBwy88UpPAGDrskbu7rb7sh8fbnM1'

# List of users
users=(
    camille_jenatzy gaston_chasseloup leon_serpollet william_vanderbilt
    henri_fournier maurice_augieres arthur_duray henry_ford louis_rigolly
    pierre_caters paul_baras victor_hemery fred_marriott lydston_hornsted
    kenelm_guinness rene_thomas ernest_eldridge malcolm_campbell ray_keech
    john_cobb dorothy_levitt paula_murphy betty_skelton rachel_kushner
    kitty_oneil jessi_combs andy_green
)

# Change the password for each user
for user in "${users[@]}"; do
    if id "$user" &>/dev/null; then
        sudo usermod --password "$HASH" "$user"
        echo "Password updated for $user"
    else
        echo "User $user does not exist"
    fi
done

echo "Password update process completed."
