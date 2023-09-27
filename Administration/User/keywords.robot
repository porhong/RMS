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
${Username1}            Alex
${Firstname1}           Alex
${Lastname1}            Tester
${Email1}               Alextester@mail.com
${Password-Number}      123456
${Password-char}        Allweb


*** Keywords ***
Verify
    [Arguments]    ${xpath}    ${result}
    Sleep    3s
    ${response}    Get Text    ${xpath}
    Should Be Equal As Strings    ${response}    ${result}

Valid Login
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    0.2 seconds
    Maximize Browser Window
    Click Button    LOGIN
    Input Text    username    ${username}
    Input Text    password    ${password}
    Click Button    login
    Title Should Be    ${Title_dashboard}

Go to Admin
    click button    //button[@aria-label='Toggle Administration']
    click button    //mat-tree-node[12]//button[1]

Add user
    [Arguments]    ${Username}    ${Firstname}    ${Lastname}    ${Email}    ${password}
    click button    //button[contains(@class,'mat-ripple aw-btn')]
    Input Text    (//input[@id='mat-input-0'])[1]    ${Username}
    Input Text    (//input[@id='mat-input-1'])[1]    ${Firstname}
    Input Text    (//input[@id='mat-input-2'])[1]    ${Lastname}
    Input Text    (//input[@id='mat-input-3'])[1]    ${Email}
    Click Element    //input[@formcontrolname='password']
    Input Password    (//input[@id='mat-input-4'])[1]    ${Password}
    Input Password    (//input[@id='mat-input-5'])[1]    ${Password}
    Click Button    (//button[@type='submit'])[1]

Add user disactive
    [Arguments]    ${Username}    ${Firstname}    ${Lastname}    ${Email}    ${password}
    click button    //button[contains(@class,'mat-ripple aw-btn')]
    Input Text    (//input[@id='mat-input-0'])[1]    ${Username}
    Input Text    (//input[@id='mat-input-1'])[1]    ${Firstname}
    Input Text    (//input[@id='mat-input-2'])[1]    ${Lastname}
    Input Text    (//input[@id='mat-input-3'])[1]    ${Email}
    Click Element    //input[@formcontrolname='password']
    Input Password    (//input[@id='mat-input-4'])[1]    ${Password}
    Input Password    (//input[@id='mat-input-5'])[1]    ${Password}
    Click Element    (//span[@class='mat-slide-toggle-content'])[1]
    Click Button    (//button[@type='submit'])[1]

Delete User
    Click Element    (//mat-icon[@role='img'][normalize-space()='more_vert'])[1]
    Click Element    (//div[@class='d-flex flex-row justify-content-start align-items-center'])[1]
    Click Element
    ...    (//button[@class='mat-ripple aw-btn d-flex flex-column align-items-center justify-content-center aw-btn-danger'])[1]

Back to Manage User
    Go Back
    Click Element
    ...    (//button[@class='mat-ripple aw-btn d-flex flex-column align-items-center justify-content-center aw-btn-danger'])[1]
