#!/bin/sh
echo ".kanbanviewrc specifies the following DB file: $(grep thingsdb /root/.kanbanviewrc | awk '{print $3}')"
if [ -z "$THINGSDB" ]
then 
  echo "No variable defined for Things sqlite DB"
  export THINGSDB=$(ls /things/*.sqlite*)
  echo "Using DB file: $THINGSDB"
  echo "If this is incorrect, modify ENV THINGSDB accordingly."
else
  echo "Starting with DB file: $THINGSDB"
fi
#sed -i "/thingsdb/c\thingsdb = $THINGSDB" /root/.kanbanviewrc

cd /usr/src/KanbanView/ && make run-api
