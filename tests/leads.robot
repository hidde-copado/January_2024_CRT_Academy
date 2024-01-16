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
    [Documentation]    Prerequisite test script for creating a random persona
    # ${name}          FakerLibrary.Name
    # ${name}          Split String                ${name}
    # ${first_name}    Set Variable                ${name}[0]
    # ${last_name}     Set Variable                ${name}[1]

Entering A Lead
    [Documentation]    Generate a test script by utilizing the recorder to input lead information within Salesforce.
    [tags]
    Appstate           Home
    LaunchApp          Sales
    ClickText          Leads
    VerifyText         Change Owner
    ClickText          New
    UseModal           On
    PickList           Salutation                  Mrs.
    TypeText           First Name                  ${first_name}
    TypeText           Last Name                   ${last_name}
    TypeText           *Company                    Copado
    PickList           *Lead Status                Working - Contacted
    PickList           Product Interest            GC5000 series
    PickList           Primary                     Yes
    ClickText          Save                        partial_match=False
    UseModal           Off
    VerifyText         Lead "Mrs. ${first_name} ${last_name}" was created.


Delete lead
    [Documentation]
    [Tags]             Lead
    Appstate           Home
    LaunchApp          Sales
    ClickText          Leads
    ClickText          ${first_name} ${last_name}
    VerifyText         Submit for Approval
    ClickText          Show more actions
    ClickText          Delete
    UseModal           On
    VerifyText         Are you sure you want to delete this lead?
    ClickText          Delete
    VerifyText         Lead "${first_name} ${last_name}" was deleted
