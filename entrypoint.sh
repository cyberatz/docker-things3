#!/bin/sh
if [ -z "$THINGSDB" ]
then 
  echo "No variable defined for Things sqlite DB"
  THINGSDB=$(ls /things/*.sqlite*)
  echo "Using DB file: $THINGSDB"
else
  echo "Starting with DB file: $THINGSDB"
fi

cd /usr/src/KanbanView/ && make run-api
