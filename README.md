Robot Framework Demo
============
I can talk for hours about the virtues and elegance of Robot Framework! But if a picture is worth a 1,000 words, how much better is an actual demonstration?

Here's the official site: https://robotframework.org/

This project will demonstrate simple tests for both a REST (Representational State Transfer) API (Application Programming Interface) endpoint and a UI (User Interface).  

# Prerequisites
* A Linux Operating System with the following installed
    1. [git](https://git-scm.com/download/linux)
    2. [docker](https://docs.docker.com/get-docker/)
# Getting Started
1. From a Linux terminal
    > git clone https://github.com/fromhtoz/RobotframeworkDemo.git
2. This will download the repository to your local hard drive
3. A script is included that will launch a docker container and execute all the tests in the repository
    > cd ./RobotframeworkDemo
    > 
    > run_all_tests.sh
 # Interactive Mode
 * The real fun is getting to run robot with different command line arguments.  For that we need the docker container to run interactively:
    > launch_robot.sh
 * The test suite README files will assume you are starting from the interactive docker terminal.
 
