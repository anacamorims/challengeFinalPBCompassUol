*** Settings ***
Library     RequestsLibrary
Library     String

*** Variables ***
${BASE_URL}        http://localhost:3000/api/v1

*** Keywords ***
Get All Sessions
    ${response}=    GET    ${BASE_URL}/sessions    expected_status=any
    [Return]    ${response}

Get Session By ID
    [Arguments]    ${session_id}
    ${response}=    GET    ${BASE_URL}/sessions/${session_id}    expected_status=any
    [Return]    ${response}

Create Session
    [Arguments]    ${movie_id}    ${theater_id}    ${date}    ${time}
    ${body}=    Create Dictionary    movieId=${movie_id}    theaterId=${theater_id}    date=${date}    time=${time}
    ${response}=    POST    ${BASE_URL}/sessions    json=${body}    expected_status=any
    [Return]    ${response}

Update Session
    [Arguments]    ${session_id}    ${movie_id}    ${theater_id}    ${date}    ${time}
    ${body}=    Create Dictionary    movieId=${movie_id}    theaterId=${theater_id}    date=${date}    time=${time}
    ${response}=    PUT    ${BASE_URL}/sessions/${session_id}    json=${body}    expected_status=any
    [Return]    ${response}

Delete Session
    [Arguments]    ${session_id}
    ${response}=    DELETE    ${BASE_URL}/sessions/${session_id}    expected_status=any
    [Return]    ${response}

Get Sessions Should Succeed
    ${response}=    Get All Sessions
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Get Session Should Succeed
    [Arguments]    ${session_id}
    ${response}=    Get Session By ID    ${session_id}
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Create Session Should Succeed
    [Arguments]    ${movie_id}    ${theater_id}    ${date}    ${time}
    ${response}=    Create Session    ${movie_id}    ${theater_id}    ${date}    ${time}
    Should Be Equal As Strings    ${response.status_code}    201
    [Return]    ${response}

Session Should Not Be Found
    [Arguments]    ${session_id}
    ${response}=    Get Session By ID    ${session_id}
    Should Be Equal As Strings    ${response.status_code}    404
    [Return]    ${response}