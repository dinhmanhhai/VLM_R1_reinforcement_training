#!/bin/bash

# Dataset Download Script for VLM-R1
# This script downloads and unzips all required datasets.

DATA_DIR="data"
mkdir -p $DATA_DIR

echo "--- Starting Dataset Downloads ---"

# 1. Annotations
echo "Downloading Annotations..."
curl -L -C - https://huggingface.co/datasets/omlab/VLM-R1/resolve/main/rec_jsons_processed.zip -o $DATA_DIR/rec_jsons_processed.zip

# 2. COCO Train2014 Images
echo "Downloading COCO Train2014 Images (~13GB)..."
curl -L -C - https://huggingface.co/datasets/omlab/VLM-R1/resolve/main/train2014.zip -o $DATA_DIR/train2014.zip

# 3. LISA-Grounding Images
echo "Downloading LISA-Grounding Images (~1.2GB)..."
curl -L -C - https://huggingface.co/datasets/omlab/VLM-R1/resolve/main/lisa_test.zip -o $DATA_DIR/lisa_test.zip

# 4. GUI Multi-image Data
echo "Downloading GUI Multi-image Data..."
curl -L -C - https://huggingface.co/datasets/omlab/VLM-R1/resolve/main/gui_multi-image.zip -o $DATA_DIR/gui_multi-image.zip

echo "--- All Downloads Attempted ---"
echo "Checking file integrity and unzipping..."

# Unzip Annotations
if [ -f "$DATA_DIR/rec_jsons_processed.zip" ]; then
    echo "Unzipping Annotations..."
    unzip -qo $DATA_DIR/rec_jsons_processed.zip -d $DATA_DIR/
fi

# Unzip COCO (if fully downloaded)
if [ -f "$DATA_DIR/train2014.zip" ]; then
    echo "Unzipping COCO (This may take a while)..."
    unzip -qo $DATA_DIR/train2014.zip -d $DATA_DIR/
fi

# Unzip LISA
if [ -f "$DATA_DIR/lisa_test.zip" ]; then
    echo "Unzipping LISA..."
    unzip -qo $DATA_DIR/lisa_test.zip -d $DATA_DIR/
fi

# Unzip GUI
if [ -f "$DATA_DIR/gui_multi-image.zip" ]; then
    echo "Unzipping GUI..."
    unzip -qo $DATA_DIR/gui_multi-image.zip -d $DATA_DIR/
fi

echo "--- Done! ---"
echo "Datasets should be in the '$DATA_DIR' directory."
ls -lh $DATA_DIR
