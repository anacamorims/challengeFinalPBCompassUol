*** Settings ***
Resource    ../resources/sessions.resource

*** Test Cases ***
Get All Sessions
    Get Sessions Should Succeed

Get Session By Valid ID
    ${response}=    Get Session By ID    1
    Should Be Equal As Strings    ${response.status_code}    400

Get Session By Invalid ID
    ${response}=    Get Session By ID    999
    Should Be Equal As Strings    ${response.status_code}    400

Create Session With Valid Data
    ${response}=    Create Session    1    1    2024-12-25    19:30
    Should Be Equal As Strings    ${response.status_code}    401

Create Session With Invalid Data
    ${response}=    Create Session    ${EMPTY}    1    2024-12-25    19:30
    Should Be Equal As Strings    ${response.status_code}    401

Update Existing Session
    ${response}=    Update Session    1    1    2    2024-12-26    20:00
    Should Be Equal As Strings    ${response.status_code}    401

Delete Existing Session
    ${response}=    Delete Session    1
    Should Be Equal As Strings    ${response.status_code}    401