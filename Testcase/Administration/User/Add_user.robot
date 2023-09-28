*** Settings ***
Documentation       Add User

Library             SeleniumLibrary
Library             FakerLibrary
Resource            ../../../Resources/Function.robot
Resource            ../../../Resources/keywords_User.robot


*** Test Cases ***
Add user successfull Set disactive
    Valid Login
    Go to Admin
    Add user disactive    ${username_gen}   ${firstname_gen}    ${lastname_gen}    ${email_gen}    ${password_gen}
    Verify    (//div[@class='message'])[1]    Create user successfully.
    Delete User
    Verify    (//div[@class='message'])[1]    Delete user successfully
    Close Browser

Add user successfull
    Valid Login
    Go to Admin
    Add user    ${username_gen}   ${firstname_gen}    ${lastname_gen}    ${email_gen}    ${password_gen}
    Sleep    1s
    Verify    (//div[@class='message'])[1]    Create user successfully.
    Delete User
    Verify    (//div[@class='message'])[1]    Delete user successfully
    Close Browser

Add user unsuccessfull
    Valid Login
    Go to Admin
    Add user    porhong    keat    porhong    porhong@allweb.com.kh.kh    ${password_gen}
    Verify    //mat-error[text()='Username already existed. ']    Username already existed.
    Back to Manage User
    Close Browser


