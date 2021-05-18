Robot Framework Demo
============
I can talk for hours about the virtues and elegance of Robot Framework! But if a picture is worth a 1,000 words, how much better is an actual demonstration?

Here's the official site: https://robotframework.org/

This project will demonstrate simple tests for both a REST (Representational State Transfer) API (Application Programming Interface) endpoint and a web page UI (User Interface).  

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
 4. Log files will be written to the ./results folder.  
     * log.html - human readable format with ability to drill down 
     * output.xml - this file is great for showing results in CI/CD pipeline tools like Jenkins
 # Interactive Mode
 * The real fun is running robot with different command line arguments.  For that we need the docker container to run interactively:
    > launch_robot.sh
 * The test suite README files will assume you are starting from the interactive docker terminal.
# Test Suites
There are two test suites with a few sample tests designed to showcase my favorite features.
1. API_Tests_UUID_Gen
    * uses [UUID Tool's](https://www.uuidtools.com/docs) API endpoint to demonstrate making and validating GET requests
2. UI_Tests_Google_Search
    * uses a [Google](google.com) web search to demostrate use of the SeleinumLibrary for manipulating and validating webpages
