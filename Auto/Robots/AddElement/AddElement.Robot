*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Add Element
    ${chrome options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Maximize Browser Window
    Go To    https://the-internet.herokuapp.com/
    Click Link    link:Add/Remove Elements
    Sleep    1s
    Click Button    Add Element
    Sleep    1s
    Wait Until Page Contains Element    class:added-manually
    Click Button    Delete
    Sleep    1s
    Go Back
    Sleep    1s
    Close Browser
