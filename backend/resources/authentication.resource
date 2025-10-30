*** Settings ***
Library     RequestsLibrary
Library     String

*** Variables ***
${BASE_URL}        http://localhost:3000/api/v1


*** Keywords ***
Register User
    [Arguments]    ${name}    ${email}    ${password}
    ${body}=    Create Dictionary    name=${name}    email=${email}    password=${password}
    ${response}=    POST    ${BASE_URL}/auth/register    json=${body}    expected_status=any
    [Return]    ${response}

Register User Should Succeed
    [Arguments]    ${name}    ${email}    ${password}
    ${response}=    Register User    ${name}    ${email}    ${password}
    Should Be Equal As Strings    ${response.status_code}    201
    [Return]    ${response}

Register User Should Fail
    [Arguments]    ${name}    ${email}    ${password}    ${expected_status}
    ${response}=    Register User    ${name}    ${email}    ${password}
    Should Be Equal As Strings    ${response.status_code}    ${expected_status}
    [Return]    ${response}

Login User
    [Arguments]    ${email}    ${password}
    ${body}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST    ${BASE_URL}/auth/login    json=${body}    expected_status=any
    [Return]    ${response}

Login Should Succeed
    [Arguments]    ${email}    ${password}
    ${response}=    Login User    ${email}    ${password}
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response}

Login Should Fail
    [Arguments]    ${email}    ${password}
    ${response}=    Login User    ${email}    ${password}
    Should Be Equal As Strings    ${response.status_code}    401
    [Return]    ${response}

Get User Profile
    [Arguments]    ${token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET    ${BASE_URL}/auth/profile    headers=${headers}    expected_status=any
    [Return]    ${response}
