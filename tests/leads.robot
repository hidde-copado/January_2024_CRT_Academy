# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***

Library                   QForce
Resource                  ../resources/keywords.robot
Library                   BuiltIn
Library                   FakerLibrary
Suite Setup               Setup Browser
Suite Teardown            End suite

*** Test Cases ***
Entering A Lead
    [Documentation]       Generate a test script by utilizing the recorder to input lead information within Salesforce.
    [tags]                Lead
    # Keyword to set the application state, e.g., Salesforce Home
    Appstate              Salesforce Home
    # Keyword to launch a Salesforce application, e.g., Sales
    LaunchApp             Leads
    ClickText             New
    UseModal              On
    VerifyText            New Lead
    PickList              Salutation                  Mr.
    TypeText              First Name                  Hidde
    TypeText              Last Name                   Visser
    TypeText              *Company                    Copado
    ClickText             Save                        partial_match=False
    UseModal              Off
    VerifyText            Lead "Mr. Hidde Visser" was created.


Modify the lead using the FakerLibrary
    [Documentation]       Modify the lead generated in the preceding test, employing the FakerLibrary to update the First and Last names.
    [Tags]                Lead
    ${first_name}=        FakerLibrary.First Name
    ${last_name}=         FakerLibrary.Last Name
    Click Text            Leads
    Click Text            Hidde Visser
    Click Text            Show more actions
    ClickText             Edit                        anchor=Change Owner
    UseModal              On
    Verify Text           Visser
    Verify Text           Hidde
    Type Text             First Name                  ${first_name}
    Type Text             Last Name                   ${last_name}
    Click Text            Save                        partial_match=False
    Use Modal             Off

Delete lead
    [Documentation]       Delete the lead using the API and leverage AI-driven intent-based testing.
    [Tags]                Delete                      Lead                        API

    # Authenticate to Salesforce
    Authenticate          client_id=${client_id}      client_secret=${client_secret}                      username=${username}    password=${password}

    # Query for the Lead record to get the ID
    ${query}=             Set Variable                SELECT Id FROM Lead WHERE Name='${first_name} ${last_name}'
    ${lead_records}=      Query Records               query=${query}
    ${lead_id}=           Set Variable                ${lead_records}[records][0][Id]

    # Delete the Lead record
    Delete Record         sobject=Lead                oid=${lead_id}

    # Verify that the Lead record has been deleted
    ${deleted_lead}=      Run Keyword And Return Status                           Get Record              sobject=Lead            oid=${lead_id}
    Should Not Be True    ${deleted_lead}             msg=The lead record was not successfully deleted.

    # Revoke the authentication token
    Revoke