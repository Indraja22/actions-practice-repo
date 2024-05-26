*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${app_url}    https://www.amazon.in
${min_wait}    30s

*** Test Cases ***
Search Product On Amazon
    Launch Browser
    Search "iPhone 15" On Amazon
    Capture Page Screenshot

*** Keywords ***
Launch Browser
    Open Browser    ${app_url}    browser=Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    ${min_wait}

Search "${product_name}" On Amazon
    Input Text    id:twotabsearchtextbox    ${product_name}
    Click Element    id:nav-search-submit-button
    Wait Until Keyword Succeeds    5x    10s    Title Should Be    Amazon.in : iPhone 15   
