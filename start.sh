#!/bin/bash

## default level
VALUE_L="0"
IS_MANUAL_CONTROLL="n"
IS_SAMPLE_CONTROLL="n"

## get args level setting
while getopts l:m:s: OPT
do
  case $OPT in
    "l" ) VALUE_L="$OPTARG" ;;
    "m" ) IS_MANUAL_CONTROLL="$OPTARG" ;;
    "s" ) IS_SAMPLE_CONTROLL="$OPTARG" ;;
  esac
done
echo "level: $VALUE_L"
echo "is_manual_controll: $IS_MANUAL_CONTROLL"

## set field parameter for level 1
GAME_TIME="300"          # game time (s)
DROP_SPEED="1000"        # drop speed (s)
RANDOM_SEED="0"          # random seed for field
OBSTACLE_HEIGHT="0"      # obstacle height (blocks)
OBSTACLE_PROBABILITY="0" # obstacle probability (percent)

case $VALUE_L in
    "0" ) GAME_TIME="-1" ;;
    "1" ) RANDOM_SEED="0" ;;
    "2" ) RANDOM_SEED="-1" ;;
    "3" ) RANDOM_SEED="-1"; OBSTACLE_HEIGHT="10"; OBSTACLE_PROBABILITY="40"; ;;
    * ) echo "invalid level: $VALUE_L"; exit 1;;
esac
echo "game_time: $GAME_TIME"

## start game
python3 game_manager/game_manager.py --game_time ${GAME_TIME} --seed ${RANDOM_SEED} --obstacle_height ${OBSTACLE_HEIGHT} --obstacle_probability ${OBSTACLE_PROBABILITY} --drop_speed ${DROP_SPEED} --manual ${IS_MANUAL_CONTROLL} --use_sample ${IS_SAMPLE_CONTROLL}
