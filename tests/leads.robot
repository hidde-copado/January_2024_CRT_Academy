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

    ClickText          Leads
    ClickText          New
    UseModal           On
    PickList           Salutation                  Mr.
    TypeText           First Name                  ${first_name}
    TypeText           Last Name                   ${last_name}
    TypeText           *Company                    Copado
    PickList           *Lead Status                Open - Not Contacted
    PickList           Product Interest            GC5000 series
    PickList           Primary                     No
    ClickText          Save                        partial_match=False
    UseModal           Off
    VerifyText         Lead "Mr. ${first_name} ${last_name}" was created.


Delete A Lead
    [Documentation]
    [Tags]
    Appstate           Home
    LaunchApp          Sales
    
    ClickText    Leads
    UseTable    Item Number
    ClickCell    r?${first_name} ${last_name}/c11
    ClickText    Delete
    UseModal    On
    VerifyText    Are you sure you want to delete this lead?
    ClickText    Delete
    VerifyText    Lead "Sheri Mitchell" was deleted. Undo
