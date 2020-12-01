# docker-things3
Example docker command:

'''
docker run --name "things" -d --restart=always -p15000:15000 \
	-v "$HOME/Library/Group Containers/JLMPQHK86H.com.culturedcode.ThingsMac/Things Database.thingsdatabase":/things \
	-v "$HOME/.kanbanviewrc":/root/.kanbanviewrc \
	andrevs/things3-api
'''  
