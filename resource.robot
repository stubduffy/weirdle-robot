*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${WEIRDLE_URL}      https://stubduffy.github.io

*** Keywords ***
Open Browser To Weirdle
    Open Browser    ${WEIRDLE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Make guess number ${number} with word ${guess} 
    Input Text    guess    ${guess}
    Click Button    submitButton
    @{characters} =  Split String To Characters    ${guess}
    FOR    ${index}    ${char}    IN ENUMERATE    @{characters}
        ${adj} =    Evaluate    ${index} + 2
        ${table_cell} =    Get Table Cell    guessTable    ${number}    ${adj}
        Should Be Equal    ${char}    ${table_cell}
    END