*** Settings ***
Documentation   This test follows the example using keywords from
...             the SeleniumLibrary

Library         SeleniumLibrary
                
*** Test Cases ***
Sort product name (A to Z)
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # sort name (a to z)
    Select From List By Value    class:product_sort_container    az
    # close browser 
    [Teardown]    Close Browser

Sort product name (Z to A)
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # sort name (z to a)
    Select From List By Value    class:product_sort_container    za
    # close browser 
    [Teardown]    Close Browser

Sort product price (low to high))
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # sort name (a to z)
    Select From List By Value    class:product_sort_container    lohi
    # close browser 
    [Teardown]    Close Browser

Sort product price (high to low)
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # sort name (z to a)
    Select From List By Value    class:product_sort_container    hilo
    # close browser 
    [Teardown]    Close Browser