*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify
    [Arguments]    ${xpath}    ${result}
    Sleep    3s
    ${response}    Get Text    ${xpath}
    Should Be Equal As Strings    ${response}    ${result}