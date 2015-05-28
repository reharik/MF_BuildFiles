#!/bin/bash          
docker run  --volumes-from datacontainer -p 27017:27017 --name mongo -d mongo_image