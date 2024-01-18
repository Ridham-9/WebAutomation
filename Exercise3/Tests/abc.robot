*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT}    30
${VALIDLINK}    xpath=//a[contains(text(), 'Click Here for Valid Link')]


*** Test Cases ***
Launch Browser
    Open Browser    https://demoqa.com/   chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Perform Action for Element Brokenlink
    Execute JavaScript    document.querySelector('#item-6').click()
    Wait Until Element Is Visible    ${VALIDLINK}    ${TIMEOUT}
   # Execute JavaScript    document.querySelector('${VALIDLINK}').click()
    #execute javascript    document.evaluate(//a[contains(text(), 'Click Here for Valid Link')])
#    wait until element is enabled    ${VALIDLINK}
    Click Link      ${VALIDLINK}
