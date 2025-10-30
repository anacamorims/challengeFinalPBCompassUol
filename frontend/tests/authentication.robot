*** Settings ***
Resource    ../resources/authentication.resource
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser Session

*** Test Cases ***
Login With Valid Credentials
    Login Should Succeed    test@example.com    password123

Login With Invalid Email
    Login Should Show Toast Error    invalid@email.com    password123

Login With Invalid Password
    Login Should Show Toast Error    test@example.com    wrongpassword

Login With Empty Fields
    Login With Empty Fields Should Show Validation    ${EMPTY}    ${EMPTY}

Register New User With Valid Data
    Open Browser To Register Page
    Register Should Succeed    John Doe    john@example.com    password123    password123

Register With Existing Email
    Open Browser To Register Page
    Register Should Show Error Message    Jane Doe    test@example.com    password123    password123

Register With Empty Name
    Open Browser To Register Page
    Register Should Show Validation Error    ${EMPTY}    john@example.com    password123    password123

Register With Invalid Email Format
    Open Browser To Register Page
    Register Should Show Email Validation    John Doe    invalid-email    password123    password123

