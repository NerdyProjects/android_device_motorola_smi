#!/bin/sh

RAZR_I_IMAGE_PATH=$1
OUTPUT_PATH=vendor

if [ -z "$RAZR_I_IMAGE_PATH" ]; then
  echo "usage: $0 Path_to_razr-i_image_folder"
  exit 1
fi

mkdir $OUTPUT_PATH
for FILE in `cat proprietary_files`; do
  NEW_NAME=`echo "$FILE" | cut -d\; -f2`
  if [ -n "$NEW_NAME" ]; then
    FILE=`echo "$FILE" | cut -d\; -f1`
  else
    NEW_NAME=$FILE
  fi
  DIR=`dirname $NEW_NAME`
  if [ ! -d "$OUTPUT_PATH/$DIR" ]; then
    mkdir -p "$OUTPUT_PATH/$DIR"
  fi
  cp "$RAZR_I_IMAGE_PATH/$FILE" "$OUTPUT_PATH/$NEW_NAME"
done
