#!/bin/bash

# params
BATCH=8
NUM_EPOCH=100
DATASET=vtei_viso
MODEL_NAME=ultralytics/models/v8/Recurrent/ReYOLOV8s
CHANNELS=5
WANDB_RUN_NAME=reyolov8_512_baseline
WANDB_PROJECT_NAME=event_satellite_detection
HYP=default_viso
S=0.0
P=0.0
Z=0.3
F=0.5
VAL_EPOCH=5
CLIP_LENGTH=11
CLIP_STRIDE=5

source ~/.venv/reyolo/bin/activate


python train.py --batch ${BATCH} --nbs ${BATCH//2} --epochs ${NUM_EPOCH} --data ${DATASET}.yaml  --model ${MODEL_NAME}.yaml \
                --channels 5 --name ${WANDB_RUN_NAME} --project ${WANDB_PROJECT_NAME}  --hyp ${HYP}.yaml --suppress ${S} \
                --positive ${P} --zoom_out ${Z} --flip ${F} --val_epoch ${VAL_EPOCH} --clip_length ${CLIP_LENGTH} --clip_stride ${CLIP_STRIDE}

deactivate