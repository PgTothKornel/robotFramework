*** Settings ***
Library    Selenium2Library
Resource    login_keywords.robot

*** Test Cases ***
Checkout tesztelése
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Element    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    test
    Input Text    //*[@id="last-name"]    test
    Input Text    //*[@id="postal-code"]    text=
    Sleep    1s
    Click Element    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Input Text    //*[@id="first-name"]    text=
    Input Text    //*[@id="last-name"]    test
    Input Text    //*[@id="postal-code"]    test
    Sleep    1s
    Click Element    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Input Text    //*[@id="first-name"]    test
    Input Text    //*[@id="last-name"]    text=
    Input Text    //*[@id="postal-code"]    test
    Click Element    //*[@id="continue"]
    Sleep    1s
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Input Text    //*[@id="first-name"]    text=>#{<>#&<>{}đäĐ[]
    Input Text    //*[@id="last-name"]    text=äđĐ]Đ[Đ][íłł|\Ä~ˇ°~]
    Input Text    //*[@id="postal-code"]    text=ääđĐ[<#&<>@]
    Sleep    1s
    Click Element    //*[@id="continue"]
    Click Button    //*[@id="cancel"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button    //*[@id="checkout"]
    ${long_name}=    Evaluate    "A" * 100
    Input Text    //*[@id="first-name"]    text=${long_name}
    Input Text    //*[@id="last-name"]    text=${long_name}
    Input Text    //*[@id="postal-code"]    text=${long_name}
    Sleep    1s
    Click Element    //*[@id="continue"]
    Click Button    //*[@id="cancel"]
    Click Element    //*[@id="shopping_cart_container"]/a
    ${cim}=    Get Location
    Click Button    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=1234567890
    Input Text    //*[@id="last-name"]    text=1234567890
    Input Text    //*[@id="postal-code"]    text=1234567890
    Sleep    1s
    Click Element    //*[@id="cancel"]
    ${cim2}=    Get Location
    Should Be Equal As Strings    first=${cim}    second=${cim2}
    Click Element    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    text=1234567890
    Input Text    //*[@id="last-name"]    text=1234567890
    Input Text    //*[@id="postal-code"]    text=1234567890
    Sleep    1s
    Click Element    //*[@id="continue"]
    Sleep    1s
    Click Element    //*[@id="finish"]
    Sleep    1s
    Click Button    //*[@id="back-to-products"]
    Sleep    1s
    Close Browser