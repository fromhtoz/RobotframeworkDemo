#!/usr/bin/env bash

docker run \
    -v "$PWD/results":/opt/robotframework/reports:Z \
    -v "$PWD":/opt/robotframework/tests:Z \
    ppodgorsek/robot-framework:latest
