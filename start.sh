#!/bin/bash
cd /home/dwemer/remote-faster-whisper
#lib_path="$( dirname $( find /home/dwemer/python-stt/ -type f -name "libcudnn_ops_infer.so*" | head -1 ) )"
export LD_LIBRARY_PATH=${lib_path}:$LD_LIBRARY_PATH
source /home/dwemer/python-stt/bin/activate
python3 remote_faster_whisper.py  -c /home/dwemer/remote-faster-whisper/config.yaml &> log.txt&



