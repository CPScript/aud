#!/bin/bash
cd; cd /system-audit
DIR="/src"
FILE_PATH="./licence.txt"

if [ -f "$FILE_PATH" ]; then
  echo "SYSTEM-AUDIT's LICENCE"
  cat "$FILE_PATH"
else
  echo "Licence not found: $FILE_PATH"
  echo "DO NOT EDIT THE LICENCE"
  rm -f "$DIR"/*
  
fi
