*** Settings ***
Documentation       A test suite with a single test for weirdle.

Resource            resource.robot
Library             Baloney.py
Library    Process
Library    OperatingSystem

Test Setup          Remove File    *.png
Test Teardown       Log To Console    tear it down
...


*** Test Cases ***
Open Weirdle
    Open Browser To Weirdle
    Make guess number 1 with word phone
    Make guess number 2 with word death
    Make guess number 3 with word creep
    Make guess number 4 with word quiet
    Make guess number 5 with word slush
    Make guess number 6 with word weird
    Capture Page Screenshot
    Element Should Be Disabled    submitButton
    Page Should Contain    Sorry, you're too rubbish
    ${baloney} =    Do Something
    Log To Console    ${baloney}
