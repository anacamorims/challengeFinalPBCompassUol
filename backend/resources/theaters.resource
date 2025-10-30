*** Settings ***
Library     RequestsLibrary
Library     String

*** Variables ***
${BASE_URL}        http://localhost:3000/api/v1

*** Keywords ***
Get All Theaters
    ${response}=    GET    ${BASE_URL}/theaters    expected_status=any
    [Return]    ${response}

Get Theater By ID
    [Arguments]    ${theater_id}
    ${response}=    GET    ${BASE_URL}/theaters/${theater_id}    expected_status=any
    [Return]    ${response}

Create Theater
    [Arguments]    ${name}    ${location}    ${capacity}
    ${body}=    Create Dictionary    name=${name}    location=${location}    capacity=${capacity}
    ${response}=    POST    ${BASE_URL}/theaters    json=${body}    expected_status=any
    [Return]    ${response}

Update Theater
    [Arguments]    ${theater_id}    ${name}    ${location}    ${capacity}
    ${body}=    Create Dictionary    name=${name}    location=${location}    capacity=${capacity}
    ${response}=    PUT    ${BASE_URL}/theaters/${theater_id}    json=${body}    expected_status=any
    [Return]    ${response}

Delete Theater
    [Arguments]    ${theater_id}
    ${response}=    DELETE    ${BASE_URL}/theaters/${theater_id}    expected_status=any
    [Return]    ${response}

Get Theaters Should Succeed
    ${response}=    Get All Theaters
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Get Theater Should Succeed
    [Arguments]    ${theater_id}
    ${response}=    Get Theater By ID    ${theater_id}
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Create Theater Should Succeed
    [Arguments]    ${name}    ${location}    ${capacity}
    ${response}=    Create Theater    ${name}    ${location}    ${capacity}
    Should Be Equal As Strings    ${response.status_code}    201
    [Return]    ${response}

Theater Should Not Be Found
    [Arguments]    ${theater_id}
    ${response}=    Get Theater By ID    ${theater_id}
    Should Be Equal As Strings    ${response.status_code}    404
    [Return]    ${response}