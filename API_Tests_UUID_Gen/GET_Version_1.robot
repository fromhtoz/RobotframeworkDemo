*** Settings ***
Library    RequestsLibrary
Library    uuid_validation.py
Variables    ./common_variables.py

*** Variables ***
${test_url} =  ${base_url}/v1

*** Keywords ***
UUID_Base_Validations
    [Arguments]  ${response_body}  ${expected_length}
    Length Should Be  ${response_body.json()}  ${expected_length}
    FOR  ${uuid}  IN  @{response_body.json()}
        ${valid_format} =  check_valid_uuid_format  ${uuid}  version=1
        Should Be True  ${valid_format}
    END

*** Test Cases ***
GET Version 1 UUID No Params
    ${response} =  GET  ${test_url}  expected_status=200
    UUID_Base_Validations  ${response}  1

GET Version 1 UUID Max
    ${response} =  GET  ${test_url}/count/100  expected_status=200
    UUID_Base_Validations  ${response}  100

GET Version 1 UUID Zero
    ${response} =  GET  ${test_url}/count/0  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  {u'count': [u'The count must be between 1 and 100.']}

GET Version 1 UUID Max+1
    ${response} =  GET  ${test_url}/count/101  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  {u'count': [u'The count must be between 1 and 100.']}
