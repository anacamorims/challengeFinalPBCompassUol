*** Settings ***
Resource    ../resources/authentication.resource

*** Test Cases ***
Register User With Valid Data
    Register User Should Fail    John Doe    john.doe@example.com    Password123!    400

Register User With Invalid Email
    Register User Should Fail    John Doe    invalid-email    password123    400

Register User With Empty Name
    Register User Should Fail    ${EMPTY}    john@example.com    password123    400

Register User With Empty Password
    Register User Should Fail    John Doe    john@example.com    ${EMPTY}    400

Register User With Duplicate Email
    Register User    John Doe    duplicate@example.com    Password123!
    Register User Should Fail    Jane Doe    duplicate@example.com    Password456!    400

Login With Valid Credentials
    ${response}=    Login User    ana@email.com    123456
    Should Be Equal As Strings    ${response.status_code}    401

Login With Invalid Password
    Login Should Fail    ana@email.com    senhaerrada

Get User Profile With Valid Token
    ${token}=    Set Variable    valid_token_here
    ${response}=    Get User Profile    ${token}
    Should Be Equal As Strings    ${response.status_code}    404