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

Entering A Lead
    [Documentation]    Generate a test script by utilizing the recorder to input lead information within Salesforce.
    [tags]             Lead
    # Keyword to set the application state, e.g., Salesforce Home

    # Keyword to launch a Salesforce application, e.g., Sales

     # Keyword to click on text elements on the web page

    # Keyword to verify that a text appears on the screen

    # Keyword to turn limiting text search to modal dialogs on or off

    # Keyword to select a value from a Salesforce pick list

    # Keyword to type text into a text field

Modify the lead using the FakerLibrary
    [Documentation]    Modify the lead generated in the preceding test, employing the FakerLibrary to update the First and Last names.
    [Tags]             Lead

Delete lead
    [Documentation]    Delete the lead using the API and leverage AI-driven intent-based testing.
    [Tags]             Lead
    