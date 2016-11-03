#!/bin/bash

source /opt/DL/caffe-nv/bin/caffe-activate
cd
ln -s /opt/pet-breed-master ./pet-breed
cd pet-breed
exec python web_demo/app.py -g 2>&1
