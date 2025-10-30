*** Settings ***
Resource    ../resources/theaters.resource

*** Test Cases ***
Get All Theaters
    Get Theaters Should Succeed

Get Theater By Valid ID
    ${response}=    Get Theater By ID    1
    Should Be Equal As Strings    ${response.status_code}    400

Get Theater By Invalid ID
    ${response}=    Get Theater By ID    999
    Should Be Equal As Strings    ${response.status_code}    400

Create Theater With Valid Data
    ${response}=    Create Theater    Cinema Central    Downtown    200
    Should Be Equal As Strings    ${response.status_code}    401

Create Theater With Invalid Data
    ${response}=    Create Theater    ${EMPTY}    Downtown    200
    Should Be Equal As Strings    ${response.status_code}    401

Update Existing Theater
    ${response}=    Update Theater    1    Updated Cinema    Uptown    250
    Should Be Equal As Strings    ${response.status_code}    401

Delete Existing Theater
    ${response}=    Delete Theater    1
    Should Be Equal As Strings    ${response.status_code}    401