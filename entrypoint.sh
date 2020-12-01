#!/bin/sh
#sed -i "/background-image: linear-gradient(45deg, rgb(100, 50, 50), rgb(150, 50, 50));/c\background-image: linear-gradient(45deg, rgb(100, 100, 100), rgb(20, 20, 155));" /usr/src/KanbanView/resources/kanban.css
#sed -i "/background: #fff;/c\background: #d4e5fc;" /usr/src/KanbanView/resources/kanban.css

curl -s -o /usr/src/KanbanView/resources/logo-dark.png https://culturedcode.com/things/2017-03-25/images/appicon-mac.png

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
