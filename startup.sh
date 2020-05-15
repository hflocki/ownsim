#!/bin/bash
cd /opt/opensim/
screen -fa -S Sandbox -d -U -m env LANG=C mono --optimize=all OpenSim.exe
