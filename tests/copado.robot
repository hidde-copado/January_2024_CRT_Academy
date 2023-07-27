# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***

Library                QWeb
Resource               ../resources/keywords.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***

Multiple elements with same name
    [Documentation]    Test sript to show the anchor options,
    ...                when interacting with elements with the same name.
    GoTo               https://www.copado.com
    VerifyText         Learn More

Self healing
    [Documentation]    Test script for demonstrating self healing.
    GoTo               https://www.copado.com
    ClickText          SPEAK TO SALES