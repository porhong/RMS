*** Settings ***
Documentation       Keywords
Library             SeleniumLibrary


*** Variables ***
${LOGIN URL}            https://dev.allweb.com.kh/rms/
${BROWSER}              chrome
${Title_login}          ALLWEB Recruitment Management System
${Title_dashboard}      ALLWEB Recruitment Management System
${username}             porhong
${password}             123
# Testdata
${Username1}             Alex
${Firstname1}            Alex
${Lastname1}             Tester
${Email1}                Alextester@mail.com
${Password-Number}      123456
${Password-char}        Allweb


*** Keywords ***
Verify add user successfull
    ${response}    Get Text    (//div[@class='message'])[1]
    Should Be Equal As Strings    ${response}    Create user successfully.
Verify delete user successfull
    ${response}    Get Text    (//div[@class='message'])[1]
    Should Be Equal As Strings    ${response}    Delete user successfully
Valid Login
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    0.3 seconds
    Maximize Browser Window
    Click Button    LOGIN
    Input Text    username    ${username}
    Input Text    password    ${password}
    Click Button    login
    Title Should Be    ${Title_dashboard}

Go to Admin
    click button    //button[@aria-label='Toggle Administration']
    click button    //mat-tree-node[12]//button[1]
    click button    //button[@type='button']

Add user
    [Arguments]    ${Username}    ${Firstname}    ${Lastname}    ${Email}    ${password}    
    Input Text    //input[@id='mat-input-0']    ${Username}   
    Input Text    //input[@id='mat-input-1']    ${Firstname}
    Input Text    //input[@id='mat-input-2']    ${Lastname}
    Input Text    //input[@id='mat-input-3']    ${Email}
    Input Password    //input[@id='mat-input-4']    ${Password}
    Input Password    //input[@id='mat-input-5']    ${Password}
    Click Button    //button[@type='submit']
Delete User
    Click Element    (//mat-icon[@role='img'][normalize-space()='more_vert'])[1]
    Click Element    (//div[@class='d-flex flex-row justify-content-start align-items-center'])[1]
    Click Element    (//button[@class='mat-ripple aw-btn d-flex flex-column align-items-center justify-content-center aw-btn-danger'])[1]


    