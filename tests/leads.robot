# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                      ../resources/keywords.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales

    ClickText    Leads
    ClickText    New
    UseModal    On
    VerifyText    New Lead
    PickList    Salutation    Ms.
    TypeText    First Name    Hidde
    TypeText    Last Name    Visser
    TypeText    *Company    Copado
    PickList    *Lead Status    Working - Contacted
    ClickText    Save    partial_match=False
    UseModal    Off
    VerifyText    Lead "Ms. Hidde Visser" was created.

Delete lead
    [Documentation]
    [Tags]
    Appstate                  Home
    LaunchApp                 Sales
    ClickText    Leads
    UseTable    Item Number
    ClickCell    r1c10
    ClickText    Delete
    UseModal    On
    ClickText    Delete
    VerifyText    Lead "Hidde Visser" was deleted.