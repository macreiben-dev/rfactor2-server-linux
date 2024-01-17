#!/bin/bash

# Get the value of the HTTP_SERVER_PORT environment variable
http_server_port="$HTTP_SERVER_PORT"
simulation_port="$SIMULATION_PORT"

# Specify the file path
json_file="/server/UserData/player/Multiplayer.JSON"

if [ ! -e "$json_file" ]; then
    echo "${json_file} not found."
    exit 0
fi

# Check if the variable is set
if [ -n "$http_server_port" ] && [ -n "$simulation_port" ] ; then
    
    # Clean previously generated files
    rm /server/UserData/player/*.tmp

    # Create a backup of the original file
    cp "$json_file" "${json_file}.tmp"

    # Update the JSON file using jq

    sed -i 's/\("Simulation Port":\)[0-9]\+/\1'"$simulation_port"'/' "${json_file}"
    sed -i 's/\("HTTP Server Port":\)[0-9]\+/\1'"$http_server_port"'/' "${json_file}"

    # Replace configuration
    mv "${json_file}_001.tmp" "${json_file}"

    echo "HTTP Server Port updated to $http_server_port in $json_file"
    echo "Simulation Port updated to $simulation_port in $json_file"
else
    echo "HTTP_SERVER_PORT environment variable is not set."
fi
