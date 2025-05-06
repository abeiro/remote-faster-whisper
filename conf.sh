#!/bin/bash
clear
cat << EOF
Faster Local Whisper

This will install Local Whisper. A STT server. Only works for English.

The "larger" the model you pick the more accurate it will translate.

But will require more hardware. Small has selection between GPU or CPU.

If not sure pick Small-GPU-EN.



EOF

if [ ! -d /home/dwemer/python-stt ]; then
        exit "WHISPER not installed"
fi

mapfile -t files < <(find /home/dwemer/remote-faster-whisper/ -name "config-*.yaml")
# Check if any files were found

if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching the pattern."
    exit 1
fi

# Display the files in a numbered list
echo -e "Select a an option from the list:\n\n"
for i in "${!files[@]}"; do
    echo "$((i+1)). ${files[$i]}"
done

echo "0. Disable service";
echo

# Prompt the user to make a selection
read -p "Select an option by picking the matching number: " selection

# Validate the input

if [ "$selection" -eq "0" ]; then
    echo "Disabling service. Run this again to enable"
    rm /home/dwemer/remote-faster-whisper/config.yaml
    exit 1
fi

if ! [[ "$selection" =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt ${#files[@]} ]; then
    echo "Invalid selection."
    exit 1
fi

# Get the selected file
selected_file="${files[$((selection-1))]}"

echo "You selected: $selected_file"

ln -sf $selected_file /home/dwemer/remote-faster-whisper/config.yaml




