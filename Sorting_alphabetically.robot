*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    login_keywords.robot

*** Keywords ***
Get all products
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${item}    IN    @{product_elements}
        ${product_name}=    Get Text    ${item}
        Append To List    ${products}    ${product_name}
    END
    RETURN    ${products}

Verify Z-A sorting
    [Arguments]    ${products}    ${felle}
    ${length}=    Get Length    ${products}
    IF    '${felle}' == 'le'
        FOR    ${i}    IN RANGE    0    ${length} - 1
        ${current}=    Get From List    ${products}    ${i}
        ${next}=    Get From List    ${products}    ${i+1}
        Should Be True    condition='${current}' >= '${next}'    msg=Product not in Z-A order ${current} < ${next}
        END
    END

    IF    '${felle}' == 'fel'
        FOR    ${i}    IN RANGE    0    ${length} - 1
        ${current}=    Get From List    ${products}    ${i}
        ${next}=    Get From List    ${products}    ${i+1}
        Should Be True    condition='${current}' <= '${next}'    msg=Product not in A-Z order ${current} > ${next}
        END
    END
    

Get all prices
    ${prices}=    Create List
    @{product_prices}=    Get WebElements    class:inventory_item_price
    FOR    ${item}    IN    @{product_prices}
        ${price}=    Get Text    ${item}
        ${substring}=    Set Variable    ${price}[1:6]
        Append To List    ${prices}    ${substring}
    END    
    RETURN    ${prices}

Verify prices low - high
    [Arguments]    ${prices}    ${felle}
    ${length}=    Get Length    ${prices}

    IF    '${felle}' == 'le'
        FOR    ${i}    IN RANGE    0    ${length} - 1
        ${current}=    Get From List    ${prices}    ${i}
        ${next}=    Get From List    ${prices}    ${i+1}
        Should Be True    condition=${current} <= ${next}    msg=Product not in low - high order, ${current} > ${next}
        END
    END

    IF    '${felle}' == 'fel'
        FOR    ${i}    IN RANGE    0    ${length} - 1
        ${current}=    Get From List    ${prices}    ${i}
        ${next}=    Get From List    ${prices}    ${i+1}
        Should Be True    condition=${current} >= ${next}    msg=Product not in high - low order, ${current} < ${next}
        END
    END
    


*** Test Cases ***
Sort products Z to A
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${products}=    Get all products
    Verify Z-A sorting    ${products}    felle=le
    Sleep    2s
    Close Browser

Sort products A to Z
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${products}=    Get all products
    Verify Z-A sorting    ${products}    felle=fel
    Sleep    2s
    Close Browser

Sort products by price, low - high
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${prices}=    Get all prices
    Verify prices low - high    ${prices}    felle=le
    Sleep    2s
    Close Browser

Sort products by price, high - low
    Open Browser    https://www.saucedemo.com/    firefox
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${prices}=    Get all prices
    Verify prices low - high    ${prices}    felle=fel
    Sleep    2s
    Close Browser