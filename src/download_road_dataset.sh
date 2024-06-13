#!/bin/bash

# MIT License
#
# Copyright (c) 2023 Md Hasan Shahriar
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Project: CANtropy - Time Series Feature Extraction-Based Intrusion Detection Systems for Controller Area Networks
# Author: Md Hasan Shahriar
# Email: hshahriar@vt.edu
#

DEFAULT_DIRECTORY="../datasets/road/"

echo "Enter the directory to download the dataset"
echo "or just press Enter to accept following default directory:"
read -p "[${DEFAULT_DIRECTORY}]:" USER_DIRECTORY
DIRECTORY="${USER_DIRECTORY:-$DEFAULT_DIRECTORY}"


if [ -d "$DIRECTORY" ]; then
  echo "The folder $DIRECTORY already exists." 
  rm -rf "$DIRECTORY"
  echo "The existing files have been deleted!"
  echo "Downloading new files...."
else
  echo "The directory $DIRECTORY created." 
fi

mkdir "$DIRECTORY" && cd "$DIRECTORY"
wget https://zenodo.org/records/10462796/files/road.zip
unzip -o road.zip -d ../
echo "Unzipped road dataset in datasets/can-ids/road/"
rm -rf *.zip
find signal_extractions/ambient/ -type f ! -name 'ambient_*' -exec rm {} +
echo "ROAD Data Downloaded!"

