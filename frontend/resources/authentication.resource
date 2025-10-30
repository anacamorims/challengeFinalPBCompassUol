*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BASE_URL}        http://localhost:3002
${BROWSER}         Chrome

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Maximize Browser Window

Open Browser To Register Page
    Open Browser    ${BASE_URL}/register    ${BROWSER}
    Maximize Browser Window

Fill Login Form
    [Arguments]    ${email}    ${password}
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}

Fill Register Form
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}
    Input Password    id=confirmPassword    ${confirm_password}

Click Login Button
    Click Element    css=.login-btn

Click Register Button
    Click Element    css=.btn.btn-primary

Login Should Succeed
    [Arguments]    ${email}    ${password}
    Fill Login Form    ${email}    ${password}
    Click Login Button
    Wait Until Element Is Visible    class=home-container

Login Should Fail
    [Arguments]    ${email}    ${password}
    Fill Login Form    ${email}    ${password}
    Click Login Button
    Wait Until Element Is Visible    class=error-message

Login With Empty Fields Should Show Validation
    [Arguments]    ${email}    ${password}
    Fill Login Form    ${email}    ${password}
    Click Login Button
    ${validation_message}=    Execute Javascript    return document.getElementById('email').validationMessage;
    Should Not Be Empty    ${validation_message}

Login Should Show Error Message
    [Arguments]    ${email}    ${password}
    Fill Login Form    ${email}    ${password}
    Click Login Button
    Wait Until Element Is Visible    css=.toast, .toasty, .notification, .alert, .error, .message    timeout=10s

Login Should Show Toast Error
    [Arguments]    ${email}    ${password}
    Fill Login Form    ${email}    ${password}
    Click Login Button
    Sleep    3s
    Location Should Contain    /login

Register Should Show Error Message
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Fill Register Form    ${name}    ${email}    ${password}    ${confirm_password}
    Click Register Button
    Wait Until Element Is Visible    css=.alert, .error, .message    timeout=5s

Register Should Show Validation Error
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Fill Register Form    ${name}    ${email}    ${password}    ${confirm_password}
    Click Register Button
    ${validation_message}=    Execute Javascript    return document.getElementById('email').validationMessage || document.getElementById('name').validationMessage;
    Should Not Be Empty    ${validation_message}

Register Should Show Email Validation
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Fill Register Form    ${name}    ${email}    ${password}    ${confirm_password}
    Click Register Button
    ${validation_message}=    Execute Javascript    return document.getElementById('email').validationMessage;
    Should Contain    ${validation_message}    @

Register Should Succeed
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Fill Register Form    ${name}    ${email}    ${password}    ${confirm_password}
    Click Register Button
    Wait Until Element Is Visible    class=header    timeout=10s

Register Should Fail
    [Arguments]    ${name}    ${email}    ${password}    ${confirm_password}
    Fill Register Form    ${name}    ${email}    ${password}    ${confirm_password}
    Click Register Button
    Wait Until Element Is Visible    class=error-message

Close Browser Session
    Close Browser