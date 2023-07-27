# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***

Library                QForce

Library                QWeb
Resource               ../resources/keywords.robot
Library                FakerLibrary
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
Create random persona
    [Documentation]
    [Tags]
    ${name}            FakerLibrary.Name
    ${name}            Split String                ${name}
    ${first_name}      Set Variable                ${name}[0]
    ${last_name}       Set Variable                ${name}[1]

Entering A Lead
    [tags]             Lead
    Appstate           Home
    LaunchApp          Sales

Delete A Lead
    [Documentation]
    [Tags]
    Appstate           Home
    LaunchApp          Sales
 