# Docker image startup script
# usage: startup.sh <URL for logging>

wget https://get.docker.com -O get_docker.sh
sh get_docker.sh

/etc/init.d/docker start

#docker run -e URL=https://webhook.site/3e5bfa2f-1a52-47ea-ad6b-882beebe4e56 -e SERVICES=http:12345,ftp:123 -e EXCLUDED_ACTIONS=\"get\" -p 12345:12345 -p 123:123 -t -d honeypots-final
#docker run -e URL=$1 -e SERVICES=$SERVICES -e EXCLUDED_ACTIONS=$EXCLUDED_ACTIONS -p 12345:12345 -p 123:123 -t -d honeypots-final


# Setup desired listening ports
HTTP_PORT=12345
FTP_PORT=123

# setup honeypots services ( used in --setup "SERVICES". Ex: http:1234,ftp:5556 )
SERVICES=http:$HTTP_PORT,ftp:$FTP_PORT

# expose the ports from the docker image to the same port on the machine. !!! each entry must be in the format "-p PORT:PORT". Multiple exposed ports must be separated with spaces
BIND_PORTS="-p $HTTP_PORT:$HTTP_PORT  -p $FTP_PORT:$FTP_PORT"

# Setup excluded actions. must include escaped double qoutes and separated by commas
EXCLUDED_ACTIONS=\"get\",\"post\",\"something\"

#login step - will be removed
docker login

# run the image
docker run -e URL=$1 -e SERVICES=$SERVICES -e EXCLUDED_ACTIONS=$EXCLUDED_ACTIONS $BIND_PORTS -it autorunnner00/my-images:start_all-1.0.0
