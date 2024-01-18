*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}   standard_user
${PASSWORD}   secret_sauce
${TIMEOUT}    10
${ERROR}    //*[@data-test="error"]
*** Keywords ***
Launch Browser
    Open Browser    https://www.saucedemo.com/   chrome    options=add_experimental_option("detach", True)

*** Test Case ***
#Valid Login
#    Launch Browser
#    Input Text    user-name    ${USERNAME}
#    Input Password    password    ${PASSWORD}
#    Click Button    login-button
#    Click Button    add-to-cart-sauce-labs-onesie           # add to cart product sauce labs onesie
#    Click Button    add-to-cart-sauce-labs-bike-light       # add to cart product sauce labs bike light
#    Wait Until Element Is Enabled    logout_sidebar_link    ${TIMEOUT}
#    Click Element    css=.shopping_cart_link                # go to cart (css syntax)
#    Click Button    continue-shopping                       # go back to continue shopping
#    Click Button    remove-sauce-labs-onesie                # remove product sauce labs onesie
#    Click Element    react-burger-menu-btn                  # go to main menu
#    Wait Until Element Is Enabled    logout_sidebar_link    ${TIMEOUT}
#    Click Element    id=logout_sidebar_link                 # logout (element specific syntax)

Ivalid Login
    Launch Browser
#    Input Text    user-name    ${USERNAME}
#    Input Password    password    wejf
#    ${elePresent}  Element Should Be Selected    ${ERROR}

