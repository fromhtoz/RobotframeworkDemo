API_Tests_UUID_Gen
==================
This test suite uses [UUID Tool's](https://www.uuidtools.com/docs) API endpoint to demonstrate making and validating GET requests

## Interactive Mode
 * First launch the Robot Framework docker container:
    > launch_robot.sh
## Layout
1. GET_UUID.robot	
    * This is a test case file.  All test case files use the extension .robot
2. common_variables.py
    * This is a file where common variable declarations go so that each test doesn't have to declare them, or a user doesn't have to enter a variable value from the command line every time.  These can be overwritten from the command line however, which is very useful for setting up CI/CD jobs to execute a single test against multiple environments.
3. requests_wrapper.py
4. uuid_validation.py
    * These are python library files used to highlight how code can be called directly from the test cases, and behind the scenens validation can be done so that the test is still very readable.
## Runtime Examples
1. Running a single test
    > robot -t GET_Default ./API_Tests_UUID_Gen
2. Running a test suite (run all the .robot test files in the given directory tree)
    > robot ./API_Tests_UUID_Gen
3. Running a test by tag (tags can be combine with suite names as well) -i includes test with the tag, -e excludes tests with the tag
    > robot -i regression 
    > 
    > robot -i regression ./API_Tests_UUID_Gen
    > 
    > robot -e error_response ./API_Tests_UUID_Gen
4. Running a test with a custom variable value
    > robot --variable uuid_version:4 ./API_Tests_UUID_Gen
