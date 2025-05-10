#!/bin/bash

cd /home/dwemer/remote-faster-whisper/
python3 -m venv /home/dwemer/python-stt
source /home/dwemer/python-stt/bin/activate

echo "Install LocalWhisper, this may take a while."
pip install -r requirements.txt

./conf.sh

