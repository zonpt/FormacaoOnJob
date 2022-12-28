*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${FILENAME} =           AssamHistoricBook.jpg
${DOWNLOAD_DIR} =       ${CURDIR}


*** Test Cases ***
File Download
    ${chrome options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Maximize Browser Window
    Go To    https://the-internet.herokuapp.com/
    Click Link    link:File Download
    Click Link    link:${FILENAME}
    Wait For Download To Complete
    Go Back
    Sleep    2s
    Close Browser


*** Keywords ***
Wait For Download To Complete
    Wait Until Keyword Succeeds
    ...    2 min
    ...    5 sec
    ...    File Should Exist
    ...    ${FILENAME}
