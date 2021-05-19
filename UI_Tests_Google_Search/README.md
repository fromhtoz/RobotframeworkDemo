UI_Tests_Google_Search
==================
This test suite uses a [Google](google.com) web search to demostrate use of the Selenium Library for manipulating and validating webpages

## Interactive Mode
 * First launch the Robot Framework docker container:
    > launch_robot.sh
## Layout
1. UI_Stock_Search.robot	
    * This is a test case file, and demonstrated the use of Test Templates
## Runtime Examples
1. Running all tests recursively.
    > robot ./
2. Since we used a variable for browser type, we could set up a job to run the tests in all supported environments
    > robot --variable browser:firefox ./UI_Tests_Google_Search

