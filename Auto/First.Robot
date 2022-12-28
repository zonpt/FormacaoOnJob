*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Worten Print
    Open Browser    https://worten.pt    Edge
    Maximize Browser Window
    Wait Until Element Is Visible    class:w-button-primary
    Click Button    class:w-button-primary
    Input Text    id:search-input    Monitor
    Press Keys    id:search-input    ENTER
    Wait Until Page Contains Element    id:order_by_search
    Select From List By Value    order_by_search    priceAsc
    Wait Until Page Does Not Contain Element     class:w-loading
    Click Element    data:option:5 estrelas
    Wait Until Page Does Not Contain Element     class:w-loading
    Click Element    data:option:24 horas úteis
    Wait Until Page Does Not Contain Element     class:w-loading
    Click Element    class:w-product__wrapper
    Scroll Element Into View    class:w-product-details__wrapper
    Capture Element Screenshot    class:w-product-details__wrapper    product-{index}.png
    Sleep    2s

