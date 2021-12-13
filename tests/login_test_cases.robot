*** Settings ***
Documentation   This test follows the example using keywords from
...             the SeleniumLibrary

Library         SeleniumLibrary
                
*** Test Cases ***
Successful user log in
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
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    # close browser 
    [Teardown]    Close Browser

Unsuccessful user log in by a locked out user with wrong password
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    wrong_password
    # click login button
    Click Button    login-button
    # should show error
    Element Text Should Be    class:error-message-container    Epic sadface: Username and password do not match any user in this service
    # close browser 
    [Teardown]    Close Browser

Logged in as problem user and sees a broken inventory page
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    problem_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # should show broken inventory page
    Element Should Contain    class:inventory_item_desc   carry.allTheThings()
    Element Should Contain    css:a#item_3_title_link .inventory_item_name    Test.allTheThings()
    # close browser 
    [Teardown]    Close Browser