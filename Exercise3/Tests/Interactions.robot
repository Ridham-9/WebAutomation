*** Settings ***
Library    SeleniumLibrary
Library    Collections
*** Variables ***
${TIMEOUT}    15
${list1}    Xpath://*[@class="vertical-list-container mt-4"]/div[1]
${list2}    Xpath://*[@class="vertical-list-container mt-4"]/div[2]
${RESIZE1}    resizableBoxWithRestriction
${DRAG1}    draggable
${DROP1}    Xpath://*[@class="drop-box ui-droppable"][1]
${ACCEPTABLE}  acceptable
${NACCEPTABLE}    notAcceptable
${DROP2}    /html/body/div[2]/div/div/div[2]/div[2]/div[2]/div/div[2]/div/div[2]
${DRAG2}    //*[@id="dragBox"]
${DROP3}    //*[@id="greedyDropBoxInner"]
${REVERT}    revertable
${NREVERT}    notRevertable
${DROP4}    /html/body/div[2]/div/div/div[2]/div[2]/div[2]/div/div[4]/div/div[2]

*** Keywords ***
Perform Action for Sortable
    Execute JavaScript    document.querySelectorAll('#item-0')[4].click();
    ${NEW}     Set Variable    ${list1}
    ${list1}   Set Variable    ${list2}
    ${list2}   Set Variable    ${NEW}


Perform Action for Resizable
    Execute JavaScript    document.querySelectorAll('#item-2')[3].click();
    Wait Until Element Is Visible    ${RESIZE1}    ${TIMEOUT}
    Execute JavaScript    document.querySelector('#${RESIZE1}')[0].style.height = '368px';
    Execute JavaScript    document.querySelector('#${RESIZE1}')[0].style.width = '421px' ;
#    Change Style Attribute    ${RESIZE1}    width    421px
#    Change Style Attribute    ${RESIZE1}    height   368px

#Change Style Attribute
#    [Arguments]    ${element_locator}    ${attribute}    ${new_value}
#    Execute JavaScript    var element = document.querySelector('${element_locator}');
#    element.style.setProperty('${attribute}', '${new_value}');

Perform Action for Droppable
    Execute JavaScript    document.querySelectorAll('#item-3')[3].click();
    Drag and Drop    ${DRAG1}    ${DROP1}
    Sleep    3s
    Click Element    droppableExample-tab-accept
#    Wait Until Element Is Visible    ${DROP2}    ${TIMEOUT}
#    Drag and Drop    ${ACCEPTABLE}    ${DROP2}
#    Drag and Drop    ${NACCEPTABLE}    ${DROP2}
#    Sleep    3s
    Click Element    droppableExample-tab-preventPropogation
    Drag and Drop    ${DRAG2}    ${DROP3}
    Sleep    3s
    Click Element    droppableExample-tab-revertable
    Drag and Drop    ${REVERT}    ${DROP4}
    Drag and Drop    ${NREVERT}    ${DROP4}
#Perform Action for Dragabble

*** Test Cases ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open Interaction Section
    Execute JavaScript    document.querySelectorAll('div.card.mt-4.top-card')[4].click();
    sleep    3s
    Perform Action for Sortable
    sleep    3s
   # Perform Action for Resizable
    sleep    3s
    Perform Action for Droppable



