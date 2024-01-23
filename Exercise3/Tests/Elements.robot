*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT}    30
${TEXTBOX}    Xpath://*[@id="item-0"][1]
${CHECKBOX}    Xpath://*[@id="item-1"][1]
${CLICKED}    ${EMPTY}
${VALIDLINK}    //*[@href="https://demoqa.com"]
${DOWNLOAD}    Xpath://*[@id="downloadButton"]
${UPLOAD}      Xpath://*[@id="uploadFile"]
${AddFile}    /home/ridham/Pictures/Screenshot from 2023-12-20 14-22-41.png
${SUBDOCUMENTS}    //*[@id="tree-node"]/ol/li/ol/li[2]/span/button

${YESMSG}    //*[@id="app"]/div/div/div[2]/div[2]/div[2]/p
*** Keywords ***
Perform Action for Element Textbox
    Execute JavaScript    document.querySelector('#item-0').click()
    Wait Until Page Contains Element    userName     ${TIMEOUT}
    Input Text    userName  ridham
    Input Text    userEmail    abc123@gmail.com
    Input Text    currentAddress    Ahmedabad
    Input Text    permanentAddress    Bhavnagar
    Execute JavaScript    document.querySelector('#submit').click()

Perform Action for Element Checkbox
    Execute JavaScript    document.querySelector('#item-1').click()
    Click Button    Xpath://*[@class="rct-collapse rct-collapse-btn"][1]
    sleep    3s
    Execute JavaScript    document.getElementById('tree-node-documents').click();
    Click Button    ${SUBDOCUMENTS}

   # Execute JavaScript    document.querySelectorAll('.rct-collapse rct-collapse-btn')[3].click();

Perform Action for Element RadioButton
    Execute JavaScript    document.querySelector('#item-2').click()
    sleep    3s
    Execute JavaScript    document.getElementById('yesRadio').click();
    Wait Until Element Contains  ${YESMSG}    You have selected Yes    timeout=10s


Perform Action for Element WebTable
    Execute JavaScript    document.querySelector('#item-3').click()
    Click Element    edit-record-2
    Sleep    2s
    Clear Element Text    userEmail
    Input Text  userEmail   abcxyz@yahoo.com
    Click Button    submit

Perform Action for Element Buttons
    Execute JavaScript    document.querySelector('#item-4').click()
    wait until element is enabled    doubleClickBtn
    Double Click Element    doubleClickBtn
    Wait Until Element Contains  doubleClickMessage    You have done a double click    timeout=10s
    Open Context Menu   rightClickBtn
    Wait Until Element Contains  rightClickMessage    You have done a right click    timeout=10s


Perform Action for Element Link
    Execute JavaScript    document.querySelector('#item-5').click()
    Click Link            dynamicLink
    ${handles}=    Get Window Handles
    ${title}  Get Title
    Should Be Equal      ${title}    DEMOQA
    Switch Window    ${handles}[0]
    Click Link   moved
    Wait Until Element Contains   linkResponse    Link has responded with staus 301 and status text Moved Permanently


Perform Action for Element Brokenlink
    Execute JavaScript    document.querySelector('#item-6').click()
    wait until element is enabled    ${VALIDLINK}
    Click Link    ${VALIDLINK}
    sleep    3s
    Go Back

Perform Action for Element Download/Upload
    Execute JavaScript    document.querySelector('#item-7').click();
    Click Element    ${DOWNLOAD}
    Choose File    ${UPLOAD}     ${AddFile}

Perform Action for Element Dynamic Properties
    Execute JavaScript    document.querySelector('#item-8').click();
    sleep    5s
    Element Should Be Enabled    enableAfter
    Element Should Be Visible    visibleAfter


*** Test Cases ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open Elements Section
    Execute JavaScript    document.querySelector('div.card.mt-4.top-card').click()
    Perform Action for Element Textbox
    sleep    5s
    Perform Action for Element Checkbox
    sleep    5s
    Perform Action for Element RadioButton
    sleep    5s
    Perform Action for Element WebTable
    sleep    5s
    Perform Action for Element Buttons
    sleep    5s
    Perform Action for Element Link
    sleep    5s
    Perform Action for Element Brokenlink
    sleep    5s
    Perform Action for Element Download/Upload
    sleep    5s
    Perform Action for Element Dynamic Properties
    sleep    7s
