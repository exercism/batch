#!/bin/bash

# clone actual repo
mkdir -p ~/.wine/drive_c/home/groophy/Desktop/gh/batch/
cp -r * ~/.wine/drive_c/home/groophy/Desktop/gh/batch/

# Get the directory of the script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Parent directory (one level up)
parent_directory="$(dirname "$script_dir")"

# Path to the JSON file
json_file="${parent_directory}/config.json"

# Check if jq is installed
if ! [ -x "$(command -v jq)" ]; then
  echo "Error: jq is not installed. Please install jq (https://stedolan.github.io/jq/) to proceed." >&2
  exit 1
fi

# Check if the JSON file exists
if [ ! -f "$json_file" ]; then
  echo "Error: JSON file not found: $json_file" >&2
  exit 1
fi

jq -r '.exercises.practice[] | "\(.slug), \(.name | gsub(" "; ""))"' "$json_file" | while IFS= read -r line; do
    # Print extracted data
    IFS=', ' read -r -a parts <<< "$line"
    slug="${parts[0]}"
    processed_name="${parts[1]}"
    
    echo "Processing exercise as test-runner with: $processed_name"
    wine cmd /c "Z:\\home\\groophy\\Desktop\\gh\\batch\\bin\\test-runner.bat $slug $processed_name"
    echo
done
