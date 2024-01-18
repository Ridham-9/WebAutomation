*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}   abcxyz
${PASSWORD}   abcxyz999@
${TIMEOUT}    30
#${FORM}          Xpath:(//div[@class="element-group"])[2]
${FORM}          Xpath://div[@class="card mt-4 top-card"][2]

${DOWNLOAD}    Xpath://*[@id="downloadButton"]
${UPLOAD}      Xpath://*[@id="uploadFile"]
${LOGIN}    Xpath://*[@id="login"]
*** Keywords ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)

Open Elements Section

    Execute JavaScript    document.querySelector('div.card.mt-4.top-card').click();
    sleep    3s
    Execute JavaScript    document.querySelector('#item-7').click();
    Click Element    ${DOWNLOAD}
    #Click Element    ${UPLOAD}
    sleep    3s
    Go Back
    Go Back
Open Form Section
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[1].click();
    sleep    3s
    Execute JavaScript    document.querySelectorAll('#item-0')[1].click();
    sleep    5s

    Go Back
    Go Back

Open Alerts, Frame & Windows
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[2].click();
    sleep    3s
    Execute JavaScript    document.querySelectorAll('#item-3')[1].click();
    sleep    5s

    Go Back
    Go Back

Open Widgets
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[3].click();
    sleep    3s
    Execute JavaScript    document.querySelectorAll('#item-4')[2].click();
    sleep    5s

    Go Back
    Go Back

Open Interactions
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[4].click();
    sleep    3s
    Execute JavaScript    document.querySelectorAll('#item-4')[3].click();
    sleep    5s

    Go Back
    Go Back

Open Book Store
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[5].click();
    Execute JavaScript    document.querySelectorAll('#item-0')[5].click();
    Input Text    userName    ${USERNAME}
    Input Password    password    ${PASSWORD}
    sleep    3s
    Execute JavaScript    document.querySelector('#login').click();




*** Test Case ***
Testcase 1
    Launch Browser
    Open Elements Section
    sleep    3s
    Open Form Section
    sleep    3s
    Open Alerts, Frame & Windows
    sleep    3s
    Open Widgets
    sleep    3s
    Open Interactions
    sleep    3s
    Open Book Store
    sleep    10s




