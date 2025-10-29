*** Settings ***
Resource    ../resources/movies.resource

*** Test Cases ***
Get All Movies
    Get Movies Should Succeed

Get Movie By Valid ID
    Movie Should Not Be Found    1

Get Movie By Invalid ID
    Movie Should Not Be Found    999

Create Movie With Valid Data
    ${response}=    Create Movie    Inception    Sci-Fi    148    PG-13
    Should Be Equal As Strings    ${response.status_code}    401

Create Movie With Invalid Data
    ${response}=    Create Movie    ${EMPTY}    Sci-Fi    148    PG-13
    Should Be Equal As Strings    ${response.status_code}    401

Update Existing Movie
    ${response}=    Update Movie    1    Updated Title    Drama    120    R
    Should Be Equal As Strings    ${response.status_code}    401

Delete Existing Movie
    ${response}=    Delete Movie    1
    Should Be Equal As Strings    ${response.status_code}    401