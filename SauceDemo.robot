*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Open saucedemo webpage
    Open Browser    https://www.saucedemo.com/    browser=FireFox
    Close Browser

Login with valid credentials
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    # Input Text    //*[@id="user-name"]    standard_user
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Click Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    asdfasjkléasdfasdfjkléasdfj
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser

Login with wrong username and valid password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    palmaiJacko
    Input Password    id:password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element   //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Password    id:password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element   //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element   //*[@id="login_button_container"]/div/form/div[3]/h3
    Close Browser