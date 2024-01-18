*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NEWTAB}    Xpath://*[@id="tabButton"]
${NEWWINDOW}    Xpath://*[@id="windowButton"]
${NEWWINDOWMSG}    Xpath://*[@id="messageWindowButton"]
${ALERT}    Xpath://*[@id="alertButton"]
${TIMERALERT}    Xpath://*[@id="timerAlertButton"]
${CONFIRMBUTTON}    Xpath://*[@id="confirmButton"]
${PROMPTBUTTON}    Xpath://*[@id="promtButton"]

*** Keywords ***
Perform Action for Browser Window
    Execute JavaScript    document.querySelectorAll('#item-0')[2].click();
    Click Button    ${NEWTAB}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    ${window_titles}    Get Text    sampleHeading
    Switch Window    ${handles}[0]
    Run Keyword If    'New Tab Title' in $window_titles    Log    New tab is open
    ...    ELSE    Log    New tab is not open
    Click Button    ${NEWWINDOW}
    ${window_titles}    Get Window Titles
    Run Keyword If    'New Window Title' in $window_titles
    ...    Log    New window is open
    ...    ELSE    Log    New window is not open
    Click Button    ${NEWWINDOWMSG}
#    ${handles}=    Get Window Handles
#    Switch Window    ${handles}[3]
#    ${window_titles}    Get Text    body
#    Run Keyword If    'New Window Title' in $window_titles
#    ...    Log    New window message is open
#    ...    ELSE    Log    New window message is not open


Perform Action for Alerts
    Execute JavaScript    document.querySelectorAll('#item-1')[1].click();
    Click Button    ${ALERT}
    Sleep    3s
    Alert Should Be Present    You clicked a button    ACCEPT
    Click Button    ${TIMERALERT}
    Sleep    3s
    Alert Should Be Present    This alert appeared after 5 seconds    ACCEPT    6s
    Click Button    ${CONFIRMBUTTON}
    Sleep    3s
    Alert Should Be Present    Do you confirm action?    DISMISS
    ${confirmresult}    Get Text    confirmResult
    Log     ${confirmresult}
 #   Click Button    ${PROMPTBUTTON}
    Execute JavaScript    document.getElementById('promtButton').click();
    Sleep    3s
    Input Text Into Alert   Ridham   ACCEPT    5s
    ${promtresult}    Get Text    promptResult
    Log     ${promtresult}

*** Test Cases ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open Alerts,Frames Section
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[2].click();
    sleep    3s
    #Perform Action for Browser Window
    Sleep    3s
    Perform Action for Alerts
