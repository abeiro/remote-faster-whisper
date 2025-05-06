#!/bin/bash

cd /home/dwemer/remote-faster-whisper/
python3 -m venv /home/dwemer/python-stt
source /home/dwemer/python-stt/bin/activate

echo "This will take a while so please wait."
pip install -r requirements.txt

./conf.sh

