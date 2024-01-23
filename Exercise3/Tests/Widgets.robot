*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${TIMEOUT}    30
${MULTICOLOR}    //*[@class="auto-complete__value-container auto-complete__value-container--is-multi css-1hwfws3"]
${SLIDER}    //*[@class="range-slider range-slider--primary"]
${PROGRESS}    //*[@class="progress-bar bg-info"]
${MENU1}    //*[@id="nav"]/li[1]/a
${MENU2}    //*[@id="nav"]/li[2]/a
${MENU3}    //*[@id="nav"]/li[3]/a
${SELECTVALUE}    Xpath://*[@id="withOptGroup"]
*** Keywords ***
Perform Action for Widgets Accordian
    Execute JavaScript    document.querySelectorAll('#item-0')[3].click();
    Click Element    Xpath://*[@id="section1Heading"]
#    Click Element    Xpath://*[@id="section2Heading"]
#    Click Element    Xpath://*[@id="section3Heading"]


Perform Action for Widgets Auto Cmplete
    Execute JavaScript    document.querySelectorAll('#item-1')[2].click();
    Click Element    ${MULTICOLOR}
  #  Input Text     ${MULTICOLOR}     Blue

Perform Action for Widgets Date Picker
    Execute JavaScript    document.querySelectorAll('#item-2')[2].click();


Perform Action for Widgets Slider
    Execute JavaScript    document.querySelectorAll('#item-3')[2].click();
 #   Click Element    ${SLIDER}    set variable  "Value" = 85
   # Set Slider   ${SLIDER}    66

Set Slider
    [Arguments]    ${locator}    ${value}
    ${element_slider}    Get WebElement    ${locator}
    ${element}    Set Variable    ${element_slider}\[0]
    Set Focus To Element    ${element}
    Execute JavaScript    arguments[0].value=${value}    ${element}

Perform Action for Widgets Progress bar
    Execute JavaScript    document.querySelectorAll('#item-4')[2].click();
    Click Button    //*[@id="startStopButton"]
    sleep  4s
    Click Button    //*[@id="startStopButton"]
    ${TEXT}    Get Text    ${PROGRESS}
    Log   ${TEXT}

Perform Action for Widgets Tool tips
    Execute JavaScript    document.querySelectorAll('#item-6')[1].click();
    Mouse Over   toolTipButton
    Mouse Over   texFieldToolTopContainer

Perform Action for Widgets Menu
    Execute JavaScript    document.querySelectorAll('#item-7')[1].click();
    Mouse Over    ${MENU1}
    sleep    1s
    Mouse Over    ${MENU2}
    Sleep    2s
    Mouse Over    ${MENU3}
    Sleep    1s

Perform Action for Widgets Select Menu
    Execute JavaScript    document.querySelectorAll('#item-8')[1].click();
 #   Execute JavaScript    document.querySelectorAll('.css-tlfecz-indicatorContainer')click():
    Select From List By Value    withOptGroup    A root option
  #  Execute JavaScript    document.querySelectorAll('.css-tlfecz-indicatorContainer')[1]click():



*** Test Cases ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open Widgets Section
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[3].click();
    sleep    3s

    Perform Action for Widgets Accordian
    sleep    3s

    Perform Action for Widgets Auto Cmplete
    sleep    3s

    Perform Action for Widgets Date Picker
    sleep    3s

    Perform Action for Widgets Slider
    sleep    6s

    Perform Action for Widgets Progress bar
    sleep    5s

    Perform Action for Widgets Tool tips
    sleep    3s

    Perform Action for Widgets Menu
    sleep    3s

    Perform Action for Widgets Select Menu
    sleep    3s

