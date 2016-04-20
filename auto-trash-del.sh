#!/bin/bash

LIVING_DAYS=3

# These directories are target for sweeper!
SWEEPED_DIRS=( $SCRIPT_OUTPUT_DIR )

sweep_files()
{
n=${#downloads[@]}
n=$((n-1))

echo "remove these fiels..."

while [ $n -ge 0 ] ;
do
find ${SWEEPED_DIRS[$n]} -mtime +$LIVING_DAYS -type f | tee $LOG_FILE
find ${SWEEPED_DIRS[$n]} -mtime +$LIVING_DAYS -type f -exec rm -f {} \;
  n=$((n-1))
done
}

sweep_files

echo "Success sweeping!!"
