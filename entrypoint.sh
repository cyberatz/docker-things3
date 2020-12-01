#!/bin/sh
if [ -z "$THINGSDB" ]
then 
  echo "No variable defined for Things sqlite DB"
  export THINGSDB=$(ls /things/*.sqlite*)
  echo "Using DB file: $THINGSDB"
else
  echo "Starting with DB file: $THINGSDB"
fi
#sed -i "/thingsdb/c\thingsdb = $THINGSDB" /root/.kanbanviewrc
echo ".kanbanviewrc - DB file location: $(grep thingsdb /root/.kanbanviewrc)"
cd /usr/src/KanbanView/ && make run-api
