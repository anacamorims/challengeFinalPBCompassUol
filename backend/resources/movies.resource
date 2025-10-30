*** Settings ***
Library     RequestsLibrary
Library     String

*** Variables ***
${BASE_URL}        http://localhost:3000/api/v1

*** Keywords ***
Get All Movies
    ${response}=    GET    ${BASE_URL}/movies    expected_status=any
    [Return]    ${response}

Get Movie By ID
    [Arguments]    ${movie_id}
    ${response}=    GET    ${BASE_URL}/movies/${movie_id}    expected_status=any
    [Return]    ${response}

Create Movie
    [Arguments]    ${title}    ${genre}    ${duration}    ${rating}
    ${body}=    Create Dictionary    title=${title}    genre=${genre}    duration=${duration}    rating=${rating}
    ${response}=    POST    ${BASE_URL}/movies    json=${body}    expected_status=any
    [Return]    ${response}

Update Movie
    [Arguments]    ${movie_id}    ${title}    ${genre}    ${duration}    ${rating}
    ${body}=    Create Dictionary    title=${title}    genre=${genre}    duration=${duration}    rating=${rating}
    ${response}=    PUT    ${BASE_URL}/movies/${movie_id}    json=${body}    expected_status=any
    [Return]    ${response}

Delete Movie
    [Arguments]    ${movie_id}
    ${response}=    DELETE    ${BASE_URL}/movies/${movie_id}    expected_status=any
    [Return]    ${response}

Get Movies Should Succeed
    ${response}=    Get All Movies
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Get Movie Should Succeed
    [Arguments]    ${movie_id}
    ${response}=    Get Movie By ID    ${movie_id}
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Create Movie Should Succeed
    [Arguments]    ${title}    ${genre}    ${duration}    ${rating}
    ${response}=    Create Movie    ${title}    ${genre}    ${duration}    ${rating}
    Should Be Equal As Strings    ${response.status_code}    201
    [Return]    ${response}

Movie Should Not Be Found
    [Arguments]    ${movie_id}
    ${response}=    Get Movie By ID    ${movie_id}
    Should Be Equal As Strings    ${response.status_code}    404
    [Return]    ${response}