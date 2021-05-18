*** Settings ***
Library  SeleniumLibrary
Test Template    Search For Stock

*** Variables ***
${base_url}=  http://google.com
${browser}=  firefox
${query_input_name}=  q
${market_summary_xpath}=  //a[.//text() = 'Market Summary']
${expected_source}=  https://www.google.com/finance

*** Keywords ***
Search For Stock
    [Arguments]  ${search_string}  ${stock_name}
    Open Browser  ${base_url}  ${browser}
    Title Should Be  Google
    Input Text    ${query_input_name}    ${search_string}
    Press Keys    ${query_input_name}    ENTER
    Wait Until Page Contains Element  xpath=${market_summary_xpath}
    Title Should Be  ${search_string} - Google Search
    ${reference_url}=  Get Element Attribute  xpath=${market_summary_xpath}  href
    Should Start With  ${reference_url}  ${expected_source}
    ${company_name} =  Get Text  ${market_summary_xpath}/parent::div/span
    Should Be Equal As Strings  ${company_name}  ${stock_name}
    [Teardown]    Close Browser

*** Test Cases ***          search_string               stock_name
Apple Search Lowercase      appl                        Apple Inc
    [Tags]  ui_regression
Apple Search Uppercase      APPL                        Apple Inc
Apple Search Fullname       Apple Inc Stock             Apple Inc
Google Search Fullname      alphabet inc stock price    Alphabet Inc Class A
