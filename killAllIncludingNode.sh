#!/bin/sh
export PATH=/usr/local/bin:$PATH

docker rm -vf $(docker ps -a -q) 2>/dev/null || echo "No more containers to remove."

docker rmi $(docker images -a ) 2>/dev/null || echo "No more containers to remove."

