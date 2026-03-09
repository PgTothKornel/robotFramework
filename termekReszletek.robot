*** Settings ***
Library    Selenium2Library
Resource    login_keywords.robot

*** Test Cases ***
Termék részleteinek nézése
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    ${nev}=    Get Text    locator=//*[@id="item_4_title_link"]/div
    ${leiras}=    Get Text    locator=//*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${kep}=    Get Element Attribute    attribute=src    locator=//*[@id="item_4_img_link"]/img
    Click Element    //*[@id="item_4_title_link"]/div
    Click Button    //*[@id="back-to-products"]
    Click Element    //*[@id="item_4_img_link"]/img
    ${nev2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${leiras2}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${kep2}=    Get Element Attribute    attribute=src    locator=//*[@id="inventory_item_container"]/div/div/div[1]/img
    Should Be Equal As Strings    first=${nev2}    second=${nev}
    Should Be Equal As Strings    first=${leiras2}    second=${leiras}
    Should Be Equal As Strings    first=${kep2}    second=${kep}
    Sleep    2s
    Close Browser