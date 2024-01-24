*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    String
Library    totp.py
Library    pyotp

*** Variables ***
${USERNAME}    //*[@id="LoginForm_username"]
${PASSWORD}    //*[@id="LoginForm_password"]
${LOGIN}    //*[@id="login-form"]/div[3]/button
${EMAIL_SERVER}   imap.gmail.com
${EMAIL_USERNAME}    ridham.chavda@volansys.com
${EMAIL_PASSWORD}    eydrhtpydxrzxyoh

${OTP_SUBJECT}    HRMS Authentication OTP

*** Keywords ***

#Get OTP From Email Body
#    [Arguments]       ${email_body}
#    ${otp}=           Get Regexp Matches    ${email_body}   ([0-9]{6})
#    [Return]          ${otp[0]}
Wait for OTP Email
    Open Mailbox    host=${EMAIL_SERVER}   user=${EMAIL_USERNAME}   password=${EMAIL_PASSWORD}  ssl=true
    ${email_index}=    Wait For Email   subject=${OTP_SUBJECT}
    ${email_body}=      Get Email Body    ${email_index}
    ${otp}=    Get Regexp Matches    ${email_body}    [0-9]{6}
    Log               OTP received: ${otp}
    [Return]          ${otp[0]}


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
#    ${totp_result}=  Get Totp    ${EMAIL_PASSWORD}

    Input Text    MfaForm_mfa_token  ${otp}




