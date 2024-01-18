*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    OperatingSystem

*** Variables ***
${MAINMENU}    class=hamburger
${OFFERING}   id=mega-menu-item-14301
${TIMEOUT}    30
${QA}    Xpath://*[@id="mega-menu-item-14162"]/a
${EXTENSION}    .csv
${TIMESTAMP}    Get Time    result_format=%Y%m%d%H%M%S

@{FILE_NAME}    /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test1
...             /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test2
...             /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test3
...             /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test4
...             /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test5
...             /home/ridham/PycharmProjects/webAutomation/Exercise2/Output/02-01-2024/test6

@{QA_DATA}    Xpath://*[@data-id="db3418e"]
...           Xpath://*[@data-id="ce38d0b"]
...           Xpath://*[@data-id="de39b55"]
...           Xpath://*[@data-id="bb20bdf"]
...           Xpath://*[@data-id="f67bf00"]
...           Xpath://*[@data-id="d9721a4"]



*** Keywords ***
Launch Browser
    Open Browser    https://www.volansys.com/   chrome    options=add_experimental_option("detach", True)

Create and Append to CSV
    FOR   ${i}  IN RANGE   0    6
        Wait Until Element Is Visible    ${QA_DATA}[${i}]    ${TIMEOUT}
        ${DATA}=    Get Text    ${QA_DATA}[${i}]
        Log     ${DATA}
        ${FILE}=    Get From List    ${FILE_NAME}    ${i}
        Create File   ${FILE_NAME}[${i}]_${TIMESTAMP}${EXTENSION}
        Append To File   ${FILE_NAME}[${i}]_${TIMESTAMP}${EXTENSION}  ${DATA}
    END

*** Test Case ***
Valid Login
    Launch Browser
    Click Element    ${MAINMENU}
    Wait Until Element Is Enabled    ${OFFERING}   ${TIMEOUT}
    Click Element    ${OFFERING}
    Click Link    ${QA}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Create and Append to CSV


