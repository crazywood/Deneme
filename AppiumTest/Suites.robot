*** Settings ***
Library           AppiumLibrary
Resource          Resources.robot

*** Test Cases ***
n11 web login
    Open Browser    https://www.n11.com/giris-yap    browser=gc
    N11Login    ${FAILED_LOGIN_USER[0]}    ${FAILED_LOGIN_USER[1]}

MobileTestCase
    Open Application    remote_url=http://localhost:4723/wd/hub    appPackage=com.experitest.ExperiBank    platformName=android    deviceName=dc672197    appActivity=LoginActivity
    Input Text    id=com.experitest.ExperiBank:id/usernameTextField    company
    Input Password    id=com.experitest.ExperiBank:id/passwordTextField    company
    Click Element    id=com.experitest.ExperiBank:id/loginButton
    Page Should Contain Element    id=com.experitest.ExperiBank:id/makePaymentButton

*** Keywords ***
N11Login
    [Arguments]    ${arg1}    ${arg2}
    Input Text    id=email    ${arg1}
    Input Password    id=password    ${arg2}
    Click Element    id=loginButton
    Page Should Not Contain Element    id=loginForm
