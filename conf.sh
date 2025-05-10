#!/bin/bash
clear
cat << EOF
LocalWhisper

This will install LocalWhisper. A STT server.
The "larger" the model the more accurate it will translate your speech.

Options:
* Small-CPU-EN = Base English model running on CPU. Only option for AMD cards.
* Small-GPU-EN = Base English model on GPU, runs faster.
* Small-GPU-ES = Base Espanol model on GPU.
* Tiny-GPU-EN = Minimal model for less powerful systems.
* GPU-Skyrim = Specially trained model for Skyrim style words.

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




