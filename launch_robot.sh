#!/usr/bin/env bash

docker run --rm -it \
    -w "/opt/robotframework/tests/" \
    -v "$PWD/results":/opt/robotframework/reports:Z \
    -v "$PWD":/opt/robotframework/tests:Z \
    ppodgorsek/robot-framework:latest \
    /bin/sh
