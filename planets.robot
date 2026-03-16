*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Bejelentkezés és hitelesítés
    Open Browser    url=https://demo.testim.io/?authuser=0    browser=firefox
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    text=John45
    Input Text    //*[@id="login"]/div[2]/input    text=John123
    Sleep    1s
    Click Element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/button/span[1]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/ul/li/a
    Location Should Be    url=https://demo.testim.io/?authuser=0    message=Nem fogadta el a helyes adatokat!
    
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    text=12314
    Input Text    //*[@id="login"]/div[2]/input    text=12344
    Sleep    1s
    Click Element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/button/span[1]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/ul/li/a
    Location Should Be    url=https://demo.testim.io/?authuser=0    message=Nem fogadta el a helytelen adatokat!


    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    text=
    Input Text    //*[@id="login"]/div[2]/input    text=
    Sleep    1s
    Click Element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Location Should Be    url=https://demo.testim.io/?authuser=0    message=Nem fogadta el az üres adatokat!
    Close Browser

Navigáció    
    Open Browser    url=https://demo.testim.io/?authuser=0    browser=firefox
    Sleep    1s
    ${db}=    Get Element Count   class:theme__card___2nWQb
    Should Be Equal As Integers    first=${db}    second=6    msg=Nem 6 elem van a főoldalon!
    Click Button    //*[@id="app"]/div/section[2]/div[5]/button
    ${db1}=    Get Element Count   class:theme__card___2nWQb
    Should Be Equal As Integers    first=${db1}    second=9    msg=Nem 9 elem van a főoldalon!
    Sleep    1s
    Close Browser

Termék böngészése
    Open Browser    url=https://demo.testim.io/?authuser=0    browser=firefox
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[1]
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[1]/ul/li[2]

    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[2]
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[2]/ul/li[2]