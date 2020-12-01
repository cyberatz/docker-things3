# -*-Dockerfile-*-
FROM andrevs/debian-python3:latest
COPY requirements.txt /
RUN pip3 install -r /requirements.txt
RUN mkdir -p /usr/src && cd /usr/src/ && git clone https://github.com/AlexanderWillner/KanbanView.git --single-branch -b v2.6.3

COPY kanban.css kanban.js /usr/src/KanbanView/resources/
WORKDIR /usr/src/KanbanView

EXPOSE 15000
RUN mkdir -p /things
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

# TODO
#Path to database - mount '/Library/Group Containers/JLMPQHK86H.com.culturedcode.ThingsMac/Things Database.thingsdatabase/ on /things
#ENV THINGSDB=/things/main.sqlite

#Tag for tasks you are waiting for
ENV TAG_WAITING=Waiting

#Tag for most important task
ENV TAG_MIT=MIT


# TODO
#Cleanup Tag
#Eisenhower "A" Tag

#FILE_CONFIG = str(Path.home()) + '/.kanbanviewrc'
#FILE_DB = '/Library/Group Containers/JLMPQHK86H.com.culturedcode.ThingsMac/Things Database.thingsdatabase/main.sqlite'



