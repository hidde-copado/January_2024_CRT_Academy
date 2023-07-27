# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***

Library                QForce
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***

Entering A Lead
    [tags]             Lead
    Appstate           Home
    LaunchApp          Sales
    ClickText          Leads
    VerifyText         Change Owner
    VerifyText         Sales
    ClickText          New
    UseModal           On
    PickList           Salutation                  Mr.
    TypeText           First Name                  Hidde
    TypeText           Last Name                   Visser
    TypeText           *Company                    Copado
    PickList           *Lead Status                Working - Contacted
    PickList           Product Interest            GC5000 series
    PickList           Primary                     No
    ClickText          Save                        partial_match=False
    UseModal           Off
    VerifyText         Lead "Mr. Hidde Visser" was created.
    

Delete A Lead
    [Documentation]
    [Tags]
    Appstate           Home
    LaunchApp          Sales

Multiple elements with same name
    [Documentation]    Test sript to show the anchor options,
    ...                when interacting with elements with the same name.
    GoTo               https://www.copado.com
    VerifyText         Learn More