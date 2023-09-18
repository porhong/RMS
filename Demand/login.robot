*** Settings ***
Documentation     Login
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://dev.allweb.com.kh/rms/
${BROWSER}        chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Submit Login
    Input Username    porhong
    Input Password    123
    Click Login
    Welcome Page Should Be Open

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    ALLWEB Recruitment Management System

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password   ${password}
    
Click Login
    Click Button    login
Submit Login
    Click Button    LOGIN

Welcome Page Should Be Open
    Title Should Be    ALLWEB Recruitment Management System