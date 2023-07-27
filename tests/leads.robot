# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
${first_name}          
${last_name}

*** Test Cases ***
Entering A Lead
    [tags]             Lead
    Appstate           Home
    LaunchApp          Sales

Delete A Lead
    [Documentation]
    [Tags]
    Appstate           Home
    LaunchApp          Sales
