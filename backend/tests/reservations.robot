*** Settings ***
Resource    ../resources/reservations.resource

*** Test Cases ***
Get All Reservations
    ${response}=    Get All Reservations
    Should Be Equal As Strings    ${response.status_code}    401

Get Reservation By Valid ID
    ${response}=    Get Reservation By ID    1
    Should Be Equal As Strings    ${response.status_code}    401

Get Reservation By Invalid ID
    ${response}=    Get Reservation By ID    999
    Should Be Equal As Strings    ${response.status_code}    401

Create Reservation With Valid Data
    ${response}=    Create Reservation    1    1    A1,A2
    Should Be Equal As Strings    ${response.status_code}    401

Create Reservation With Invalid Data
    ${response}=    Create Reservation    ${EMPTY}    1    A1
    Should Be Equal As Strings    ${response.status_code}    401

Update Existing Reservation
    ${response}=    Update Reservation    1    1    2    B1,B2
    Should Be Equal As Strings    ${response.status_code}    401

Delete Existing Reservation
    ${response}=    Delete Reservation    1
    Should Be Equal As Strings    ${response.status_code}    401