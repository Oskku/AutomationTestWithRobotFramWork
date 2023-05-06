Here's the cleaned-up version of your test:

*** Settings ***
Documentation     Validate the login form
Library           SeleniumLibrary
Library           Collections
Test Setup        Open the browser with login form
Test Teardown     Close Browser
Resource          login.resource

*** Variables ***
${css_alert}      css:.alert-danger

*** Tasks ***
Validate Unsuccessful Login Form
    Fill the login form    ${username}    ${invalid_password}
    Wait until error message is displayed
    Verify error message is correct

Validate Successful Login Form with shopping cart
    Fill the login form    ${username}    ${valid_password}
    Click Element    id:terms
    Wait for navigation link to be visible
    Validate cart titles in the shop

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username   ${username}
    Input Password    id:password    ${password}
    Click Button    ${login_button}

Wait until error message is displayed
    Wait Until Element Is Visible    ${css_alert}

Verify error message is correct
    Element Text Should Be    ${css_alert}    Incorrect username/password.

Validate cart titles in the shop
    @{listExpected} =  Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get WebElements    css:.card-title
    @{actualList} =    Create List
    FOR  ${element}  IN  @{elements}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${listExpected}    ${actualList}
    Wait Until Element Is Visible    (//button[@class='btn btn-info'][normalize-space()='Add'])[4]
    Wait Until Element Is Enabled    (//button[@class='btn btn-info'][normalize-space()='Add'])[4]
    Select the card    Blackberry
    Wait Until Element Is Visible    css:.nav-link.btn.btn-primary
    Wait Until Element Is Enabled    css:.nav-link.btn.btn-primary
    Click Element    css:.nav-link.btn.btn-primary
    Wait for total price to be displayed

Select the card
    [Arguments]    ${cardName}
    ${elements} =    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        ${element_text}=    Get Text    ${element}
        Exit For Loop If    '${cardName}' == '${element_text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    (//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]

Wait for navigation link to be visible
    Wait Until Element Is Visible    css:.nav-link

Wait for total price to be displayed
    Wait Until Element Is Visible    //strong[.='₹. 50000']