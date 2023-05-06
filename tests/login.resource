*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library      SeleniumLibrary


*** Variables ***
${chrome}    Chrome
${url}    https://rahulshettyacademy.com/loginpagePractise/
${username}    rahulshettyacademy
${valid_password}    learning
${invalid_password}    invalid
${login_button}    id:signInBtn

*** Keywords ***
Open the browser with login form
    Open Browser    ${url}    ${chrome}
Wait the element is showing in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}