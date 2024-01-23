*** Settings ***
Library    SeleniumLibrary
Library    IMAPLibrary

*** Variables ***
${USERNAME}    //*[@id="LoginForm_username"]
${PASSWORD}    //*[@id="LoginForm_password"]
${LOGIN}    //*[@id="login-form"]/div[3]/button
${EMAIL_SERVER}   imap.google.com
${EMAIL_USERNAME}    ridham.chavda@volansys.com
${EMAIL_PASSWORD}    Rchavda@#999
${OTP_SUBJECT}    Your OTP for Login

*** Keywords ***

*** Test Cases ***
Launch Browser
    Open Browser    https://hrms.volansys.com/  chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Authentication
    Input Text    ${USERNAME}    ridham.chavda
    Input Password    ${PASSWORD}    Ridham@122023
    Click Button    ${LOGIN}
     # Wait for OTP email
    ${otp}=  Wait for OTP Email

    # Enter OTP and submit
    Input Text    otp_field  ${otp}

Wait for OTP Email
    ${otp}=  IMAPLibrary.Get Email Body  ${EMAIL_SERVER}  ${EMAIL_USERNAME}  ${EMAIL_PASSWORD}  ${OTP_SUBJECT}
    Log  OTP received: ${otp}
    [Return]  ${otp}



