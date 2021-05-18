*** Settings ***
Documentation   Tests for the GET endpoint of the UUID Tools API
...             This suite also demonstrates the use of Keywords, which can be used to declare common validations used
...             by multiple tests.  This is a local Keyword, but they can also be declared and imported from another
...             directory.  We are also importing custom Python library files and calling functions from these
...             directly in the testcase and keywords.  There are also variables in use from both a file
...             import and a local declaration, both of which can be overwritten from the command line.
...             Suite Setup can call one keyword, in this case we are checking that the variable is set to a version our test cases support.
...             If not, then the test cases are skipped. 
Library    requests_wrapper.py
Library    uuid_validation.py
Variables    ./common_variables.py
Suite Setup  Check Version  ${uuid_version}

*** Variables ***
${uuid_version} =  1
${count_error_string} =  {'count': ['The count must be between 1 and 100.']}

*** Keywords ***
Check Version
    [Arguments]  ${version}
    # These tests are written for version 1 or 4 only
    @{supported_versions} =  Create List  1  4
    IF  ${version} not in @{supported_versions}
        Skip  version ${version} testing is not supported
    END

UUID_Base_Validations
    [Arguments]  ${response_body}  ${expected_length}
    #  response_body should be the return value from a GET request
    #  expected_length is the number of UUIDs we expected to receive in the response
    #  First we check the length of the response body meets expectation
    #  Then we loop through each UUID response and validate the format is correct for the UUID version under test
    Length Should Be  ${response_body.json()}  ${expected_length}
    FOR  ${uuid}  IN  @{response_body.json()}
        ${valid_format} =  check_valid_uuid_format  ${uuid}  ${uuid_version}
        Should Be True  ${valid_format}  ${uuid} is not a valid version ${uuid_version} uuid
    END

*** Test Cases ***
GET Default
    [Tags]  api_regression
    #  GET request with no arguments
    ${response} =  GET  ${base_url}/v${uuid_version}  expected_status=200
    UUID_Base_Validations  ${response}  1

GET Count Max
    # GET request with the documented max allowed count
    ${response} =  GET  ${base_url}/v${uuid_version}/count/100  expected_status=200
    UUID_Base_Validations  ${response}  100

GET Count Zero
    [Tags]  error_response
    # GET request with count of 0, we expect this to throw an error
    # the expected error string is set as a variable since multiple tests use it,
    # if it ever changes we just need to update the tests one
    ${response} =  GET  ${base_url}/v${uuid_version}/count/0  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  ${count_error_string}

GET Count Max+
    [Tags]  error_response
    ${response} =  GET  ${base_url}/v${uuid_version}/count/101  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  ${count_error_string}
