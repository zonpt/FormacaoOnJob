*** Settings ***
Library     SeleniumLibrary
Library  OperatingSystem    

*** Test Cases ***
Drag and Drop
    ${chrome options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Maximize Browser Window
    Go To    https://the-internet.herokuapp.com/
    Click Link    link:Drag and Drop
    Sleep    1s
    ${js}        Get File              drag-n-drop.js
    ${result}    Execute Javascript    ${js}; return DragNDrop("column-a", "column-b");
    Sleep    1s
    Close Browser
