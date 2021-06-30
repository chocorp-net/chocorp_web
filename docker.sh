#!/bin/bash

usage () {
    echo "usage: docker.sh [-h | --help] [--build] [--restart]"
    exit $1
}

for arg in $@
do
    case $arg in
        -h | --help)
        usage 0
        ;;
        --build)
        bld=1
        ;;
        --restart)
        res=1
        ;;
        *)
        usage 1
        ;;
    esac
done

IMAGE="chocorean/chocorp"
NAME="chocorp_web"

# if image doesn't exist, creates it
docker images | grep $IMAGE > /dev/null
if [ $? -ne 0 ] || [[ -n "$bld" ]]
then
    echo "Building image $IMAGE..."
    docker build . -t $IMAGE --no-cache=true
fi
# if container doesn't exist, creates it
id=$(docker container ps --filter name=$NAME -aq)
if [ -z "$id" ]
then
    echo "Creating container $NAME..."
    id=$(docker container create -p 3000:3000 -v /home/pi/chocorp/msg:/opt/chocorp/msg --name $NAME $IMAGE)
else
    echo "Found existing container $id"
fi
# if container exists but is not running
rid=$(docker container ps --filter id=$id -qa)
if [ -n "$rid" ]
then
    if [ -n "$res" ]
    then
        echo "Stopping container $id..."
        docker exec $id rm /opt/chocorp/tmp/pids/server.pid 2> /dev/null
        docker container stop $id > /dev/null
    fi
    id=$rid
    echo "Starting container $id..."
    docker start $id > /dev/null
fi

