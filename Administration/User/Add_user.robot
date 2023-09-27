*** Settings ***
Documentation       Add User

Library             SeleniumLibrary
Resource            keywords.robot


*** Test Cases ***
Add user successfull Set disactive
    Valid Login
    Go to Admin
    Add user disactive    ${Username1}    ${Firstname1}    ${Lastname1}    ${Email1}    ${password}
    Verify    (//div[@class='message'])[1]    Create user successfully.
    Delete User
    Verify    (//div[@class='message'])[1]    Delete user successfully
    Close Browser

Add user successfull
    Valid Login
    Go to Admin
    Add user    ${Username1}    ${Firstname1}    ${Lastname1}    ${Email1}    ${password}
    Sleep    1s
    Verify    (//div[@class='message'])[1]    Create user successfully.
    Delete User
    Verify    (//div[@class='message'])[1]    Delete user successfully
    Close Browser

Add user unsuccessfull
    Valid Login
    Go to Admin
    Add user    porhong    keat    porhong    porhong@allweb.com.kh.kh    ${password}
    Verify    //mat-error[text()='Username already existed. ']    Username already existed.
    Back to Manage User
    Close Browser
