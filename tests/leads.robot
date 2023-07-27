# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
Entering A Lead
    [tags]             Lead
    Appstate           Home
    LaunchApp          Sales

Delete lead
    [Documentation]
    [Tags]
    Appstate           Home
    LaunchApp          Sales
