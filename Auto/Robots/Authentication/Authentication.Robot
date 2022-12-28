*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${username}    admin
${password}    admin

*** Test Cases ***
User Authentication
    Open Browser    https://${username}:${password}@the-internet.herokuapp.com/basic_auth    Edge
    Wait Until Page Contains    Congratulations!    timeout=5s
    Sleep    2s
    Close Browser
