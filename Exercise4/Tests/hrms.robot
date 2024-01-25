*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    String
#Library    OTP
#Library    RPA.MFA
#Library    RPA.Email.ImapSmtp
#Library    totp.py

*** Variables ***
${USERNAME}    //*[@id="LoginForm_username"]
${PASSWORD}    //*[@id="LoginForm_password"]
${LOGIN}    //*[@id="login-form"]/div[3]/button
${EMAIL_SERVER}   imap.gmail.com
${EMAIL_USERNAME}    ridham.chavda@volansys.com
${EMAIL_PASSWORD}    eydrhtpydxrzxyoh
${SENDER_USERNAME}   hr@volansystech.com
${OTP_SUBJECT}    HRMS Authentication OTP
${VALIDATE_OTP}  //*[@id="mfa-form"]/div[3]/button
*** Keywords ***

Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}
    ${email_index}=    Wait For Email   sender=hr@volansystech.com   status=UNSEEN   timeout=300
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    \\b\\d{6}\\b
    Log               OTP received: ${otp}
    [Return]          ${otp}[1]

*** Test Cases ***
Launch Browser
    Open Browser    https://hrms.volansys.com/  chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Authentication
    Input Text    ${USERNAME}    ridham.chavda
    Input Password    ${PASSWORD}    Ridham@122023
    Click Button    ${LOGIN}
    ${otp}=  Wait for OTP email
    Input Text    MfaForm_mfa_token  ${otp}
    Click Button    ${VALIDATE_OTP}


