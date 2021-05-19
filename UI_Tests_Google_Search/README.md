UI_Tests_Google_Search
==================
This test suite uses a [Google](google.com) web search to demostrate use of the Selenium Library for manipulating and validating webpages

## Layout
1. UI_Stock_Search.robot	
    * This is a test case file to demonstrate the use of Test Templates
## Prerequisites
* To run these tests locally (and see them execute), you will need to install the following:
    1. Python3
    2. [Pip](https://pip.pypa.io/en/stable/installing/)
    3. [VirtualEnv](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/), optional if you want to run different versions of Robot Framework or Selenium Library simultaneously 
    4. [Robot Framework](https://pypi.org/project/robotframework/)
    5. [Robot Framework Seleinum Library](https://pypi.org/project/robotframework-seleniumlibrary/)
## Runtime Examples
*  Since we used a variable for browser type, we could set up CI/CD jobs to run the tests in all supported environments
    > robot --variable browser:firefox ./UI_Tests_Google_Search
