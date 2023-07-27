*** Settings ***
Library                QWeb
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***

Multiple elements with same name
    [Documentation]    Test sript to show the anchor options,
    ...                when interacting with elements with the same name.
    GoTo               https://www.copado.com/robotic-testing
    VerifyText         Learn More

Self healing
    [Documentation]    Test script for demonstrating self healing.
    GoTo               https://www.copado.com/robotic-testing
    ClickText          SPEAK TO SALES    timeout=1s