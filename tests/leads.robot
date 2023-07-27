# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
Entering A Lead
    [Documentation]    This testscript is used for entering a lead within Salesforce.
    [tags]             Lead    smoke    sanity
    Appstate           Home
    LaunchApp          Sales

Delete lead
    [Documentation]
    [Tags]    Lead
    Appstate           Home
    LaunchApp          Sales
