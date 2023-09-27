*** Settings ***
Documentation     Add User
Library           SeleniumLibrary
Resource          keywords.robot
*** Variables ***
${LOGIN URL}      https://dev.allweb.com.kh/rms/
${BROWSER}        chrome

*** Test Cases ***

Valid Login
    Valid Login
    Go to Admin
    Add user    ${Username1}    ${Firstname1}    ${Lastname1}    ${Email1}    ${password}
    Verify add user successfull
    Delete User
    Verify delete user successfull
                  
