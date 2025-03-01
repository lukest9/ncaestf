#!/bin/bash

echo "Monitoring and killing pts/1 session..."
while true; do
    # Get the user associated with pts/1
    SESSION=$(who | grep 'pts/1' | awk '{print $1}')
    
    # If a user is found on pts/1, kill the session
    if [ -n "$SESSION" ]; then
        echo "Killing session pts/1 for user: $SESSION"
        pkill -KILL -t pts/1
    fi

    # Sleep for a second before checking again
    sleep 1
done
