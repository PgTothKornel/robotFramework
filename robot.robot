*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Buy product and complete checkout
    Open Browser     https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    //*[@id="login-button"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    korn
    Input Text    //*[@id="last-name"]    el
    Input Text    //*[@id="postal-code"]    6000
    Click Button    //*[@id="continue"]
    Click Button    //*[@id="finish"]
    Page Should Contain Element   //*[@id="checkout_complete_container"]
    Click Button    //*[@id="back-to-products"]
    Close Browser