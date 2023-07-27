# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource               ../resources/keywords.robot
Library                FakerLibrary
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
Create random persona
    [Documentation]    Prerequisite test script for creating a random persona
    ${name}            FakerLibrary.Name

Entering A Lead
    [Documentation]    This testscript is used for entering a lead within Salesforce.
    [tags]             Lead                        smoke                  sanity
    Appstate           Home
    LaunchApp          Sales
    ClickText          Leads
    VerifyText         Change Owner
    ClickText          New
    UseModal           On
    PickList           Salutation                  Mrs.
    TypeText           First Name                  Hidde
    TypeText           Last Name                   Visser
    TypeText           *Company                    Copado
    PickList           *Lead Status                Working - Contacted
    PickList           Product Interest            GC5000 series
    PickList           Primary                     Yes
    ClickText          Save                        partial_match=False
    UseModal           Off
    VerifyText         Lead "Mrs. Hidde Visser" was created.


Delete lead
    [Documentation]
    [Tags]             Lead
    Appstate           Home
    LaunchApp          Sales
