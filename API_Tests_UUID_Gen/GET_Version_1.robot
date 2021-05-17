*** Settings ***
Library    RequestsLibrary
Library    uuid_validation.py
Variables    ./common_variables.py

*** Variables ***
${test_url} =  ${base_url}/v1

*** Test Cases ***
GET Single Version 1 UUID
    ${response} =  GET  ${test_url}  expected_status=200
    Length Should Be  ${response.json()}  1
    ${valid_format} =  check_valid_uuid_format  ${response.json()[0]}  version=1
    Should Be True  ${valid_format}

