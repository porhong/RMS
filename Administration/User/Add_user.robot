*** Settings ***
Documentation     Add User
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***

Add user successfull
    Valid Login
    Go to Admin
    Add user    ${Username1}    ${Firstname1}    ${Lastname1}    ${Email1}    ${password}
    Verify add user successfull
    Delete User
    Verify delete user successfull
    Close Browser
Add user successfull Set active
    Valid Login
    Go to Admin
    Add user    ${Username1}    ${Firstname1}    ${Lastname1}    ${Email1}    ${password}
    Verify add user successfull
    Delete User
    Verify delete user successfull
    Close Browser
Add user unsuccessfull
    Valid Login
    Go to Admin
    Add user    porhong    keat    porhong    porhong@allweb.com.kh.kh    ${password}
    Verify username existed
    Back to Manage User
    Close Browser
                  
