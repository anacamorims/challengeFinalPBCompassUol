*** Settings ***
Library     RequestsLibrary
Library     String

*** Variables ***
${BASE_URL}        http://localhost:3000/api/v1

*** Keywords ***
Get All Reservations
    ${response}=    GET    ${BASE_URL}/reservations    expected_status=any
    [Return]    ${response}

Get Reservation By ID
    [Arguments]    ${reservation_id}
    ${response}=    GET    ${BASE_URL}/reservations/${reservation_id}    expected_status=any
    [Return]    ${response}

Create Reservation
    [Arguments]    ${user_id}    ${session_id}    ${seats}
    ${body}=    Create Dictionary    userId=${user_id}    sessionId=${session_id}    seats=${seats}
    ${response}=    POST    ${BASE_URL}/reservations    json=${body}    expected_status=any
    [Return]    ${response}

Update Reservation
    [Arguments]    ${reservation_id}    ${user_id}    ${session_id}    ${seats}
    ${body}=    Create Dictionary    userId=${user_id}    sessionId=${session_id}    seats=${seats}
    ${response}=    PUT    ${BASE_URL}/reservations/${reservation_id}    json=${body}    expected_status=any
    [Return]    ${response}

Delete Reservation
    [Arguments]    ${reservation_id}
    ${response}=    DELETE    ${BASE_URL}/reservations/${reservation_id}    expected_status=any
    [Return]    ${response}

Get Reservations Should Succeed
    ${response}=    Get All Reservations
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Get Reservation Should Succeed
    [Arguments]    ${reservation_id}
    ${response}=    Get Reservation By ID    ${reservation_id}
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Create Reservation Should Succeed
    [Arguments]    ${user_id}    ${session_id}    ${seats}
    ${response}=    Create Reservation    ${user_id}    ${session_id}    ${seats}
    Should Be Equal As Strings    ${response.status_code}    201
    [Return]    ${response}

Reservation Should Not Be Found
    [Arguments]    ${reservation_id}
    ${response}=    Get Reservation By ID    ${reservation_id}
    Should Be Equal As Strings    ${response.status_code}    404
    [Return]    ${response}