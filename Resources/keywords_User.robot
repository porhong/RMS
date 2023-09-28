*** Settings ***
Documentation       Keywords user
Library             SeleniumLibrary        
Library             FakerLibrary
Variables    Data.py

*** Keywords ***


Valid Login
    Open Browser    ${Config.url}    ${Config.browser}
    Set Selenium Speed    0.2 seconds
    Maximize Browser Window
    Click Button    LOGIN
    Input Text    username    ${Config.username}
    Input Text    password    ${Config.password}
    Click Button    login
    Title Should Be    ${dashbord_title}

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
