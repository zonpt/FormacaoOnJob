*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     JSONLibrary
Library     Collections


*** Variables ***
${api_url}      https://petstore3.swagger.io
${service}      /api/v3/pet/1
${field}        name
${result}       Velociraptor
${content_type}    application/json


*** Test Cases ***
Post Test
    Create Session    mysession    ${api_url}    verify=true
    ${response}=    GET On Session    mysession    ${service}    params=
    Status Should Be    200    ${response}    #Check Status as 200

    #Check field as result from Response Body
    ${field}=    Get Value From Json    ${response.json()}    ${field}
    ${fieldFromList}=    Get From List    ${field}    0
    Should be equal    ${fieldFromList}    ${result}

