#!/bin/sh
dockerd
sleep 5
docker-compose up --build --scale slave0=10
