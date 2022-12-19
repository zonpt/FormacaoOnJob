*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Worten Search
    Open Browser    https://worten.pt    Edge
    Maximize Browser Window
    Wait Until Element Is Visible    class:w-button-primary
    Click Button    class:w-button-primary
    Input Text    id:search-input    Monitor
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    Click Element    data:option:5 estrelas
    Sleep    1s
    Click Element    data:option:24 horas úteis
    Sleep    1s
    Select From List By Value    order_by_search    priceAsc
    Sleep    10s

