#!/bin/bash

# Get the value of the HTTP_SERVER_PORT environment variable
http_server_port="$HTTP_SERVER_PORT"

# Specify the file path
json_file="/server/UserData/player/Multiplayer.JSON"

if [ -e "$json_file" ]; then
    echo "${json_file} not found."
    exit(0)
fi

# Check if the variable is set
if [ -n "$http_server_port" ]; then
    
    # Clean previously generated files
    rm /server/UserData/player/*.tmp

    # Create a backup of the original file
    cp "$json_file" "${json_file}.tmp"

    # Update the JSON file using jq
    jq --argjson new_port "$http_server_port" '.["Multiplayer General Options"]["HTTP Server Port"]=$new_port' "${json_file}.tmp" > "${json_file}_001.tmp"
    jq --argjson new_port "$http_server_port" '.["Multiplayer General Options"]["HTTP Server Port"]=$new_port' "${json_file}_001.tmp" > "${json_file}_002.tmp"

    # Replace configuration
    mv "${json_file}_002.tmp" "${json_file}"

    echo "HTTP Server Port updated to $http_server_port in $json_file"
else
    echo "HTTP_SERVER_PORT environment variable is not set."
fi
