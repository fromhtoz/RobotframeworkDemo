*** Settings ***
Library    requests_wrapper.py
Library    uuid_validation.py
Variables    ./common_variables.py

*** Variables ***
${uuid_version} =  1

*** Keywords ***
UUID_Base_Validations
    [Arguments]  ${response_body}  ${expected_length}
    Length Should Be  ${response_body.json()}  ${expected_length}
    FOR  ${uuid}  IN  @{response_body.json()}
        ${valid_format} =  check_valid_uuid_format  ${uuid}  ${uuid_version}
        Should Be True  ${valid_format}
    END

*** Test Cases ***
GET Default
    ${response} =  GET  ${base_url}/v${uuid_version}  expected_status=200
    UUID_Base_Validations  ${response}  1

GET Count Max
    ${response} =  GET  ${base_url}/v${uuid_version}/count/100  expected_status=200
    UUID_Base_Validations  ${response}  100

GET Count Zero
    ${response} =  GET  ${base_url}/v${uuid_version}/count/0  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  {'count': ['The count must be between 1 and 100.']}

GET Count Max+1
    ${response} =  GET  ${base_url}/v${uuid_version}/count/101  expected_status=400
    Should Be Equal As Strings  ${response.json()['errors']}  {'count': ['The count must be between 1 and 100.']}
