*** Settings ***
Documentation     Validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#Resource
*** Variables ***

${chrome}    Chrome
${url}    https://rahulshettyacademy.com/loginpagePractise/
${username}    osku
${password}    password
${login_button}    id:signInBtn
${css_alert}    css:.alert-danger

*** Test Cases ***
Validate Succesfull Login Form
    Open the browser with login form
    Fill the login form
    Wait untile it checks and display error message
    Verify error message is correct
*** Keywords ***
Open the browser with login form
    Open Browser    ${url}    ${chrome}

Fill the login form
    Input Text    id:username   ${username}
    Input Password    id:password    ${password}
    Click Button    ${login_button}  

Wait untile it checks and display error message
    Wait Until Element Is Visible    ${css_alert}


Verify error message is correct
    Element Text Should Be    ${css_alert}    Incorrect username/password.
