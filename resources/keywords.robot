*** Settings ***
Library                   QForce
Library                   String


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${BROWSER}                chrome
${login_url}              ${url}           # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home
${client_id}              3MVG9_MSrVW5eWEml1ZrzWBkwtYpMUPR.7Txa5qdIwcKWtSH6ttPLCrA2Qf2R1Kg8VKju4RE3A4awf4.lq2OJ
${client_secret}          ECE33C123A23FD2737081C02AC9E89E6BC118E153F998A565DE6A33DBD3F07E3


*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example 
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order                          QForce    QWeb
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             LineBreak                   ${EMPTY}               #\ue000
    SetConfig             DefaultTimeout              20s                    #sometimes salesforce is slow
    Evaluate              random.seed()               random                 # initialize random generator


End suite
    Close All Browsers


Login
    [Documentation]       Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}
    TypeText                    Password                    ${password}
    ClickText                   Log In
    ${isMFA}=                   IsText                      Verify Your Identity        #Determines MFA is prompted
    Log To Console              ${isMFA}
    IF                          ${isMFA}                    #Conditional Statement for if MFA verification is required to proceed
        ${mfa_code}=            GetOTP                      ${username}                 ${secret}                ${password}
        TypeSecret              Code                        ${mfa_code}
        ClickText               Verify
    END


Login As
    [Documentation]       Login As different persona. User needs to be logged into Salesforce with Admin rights
    ...                   before calling this keyword to change persona.
    ...                   Example:
    ...                   LoginAs    Chatter Expert
    [Arguments]           ${persona}
    ClickText             Setup
    ClickText             Setup for current app
    SwitchWindow          NEW
    TypeText              Search Setup                ${persona}             delay=2
    ClickText             User                        anchor=${persona}      delay=5    # wait for list to populate, then click
    VerifyText            Freeze                      timeout=45                        # this is slow, needs longer timeout          
    ClickText             Login                       anchor=Freeze          delay=1      

Fill MFA
    ${mfa_code}=         GetOTP    ${username}   ${secret}   ${login_url}    
    TypeSecret           Verification Code       ${mfa_code}      
    ClickText            Verify 


Salesforce Home
    [Documentation]       Navigate to homepage, login if needed
    GoTo                  ${home_url}
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.    timeout=2s
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce


# Example of custom keyword with robot fw syntax
# VerifyStage
#     [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
#     [Arguments]           ${text}                     ${selected}=true
#     VerifyElement        //a[@title\="${text}" and (@aria-checked\="${selected}" or @aria-selected\="${selected}")]


# NoData
#     VerifyNoText          ${data}                     timeout=3                        delay=2


# DeleteAccounts
#     [Documentation]       RunBlock to remove all data until it doesn't exist anymore
#     ClickText             ${data}
#     ClickText             Delete
#     VerifyText            Are you sure you want to delete this account?
#     ClickText             Delete                      2
#     VerifyText            Undo
#     VerifyNoText          Undo
#     ClickText             Accounts                    partial_match=False


# DeleteLeads
#     [Documentation]       RunBlock to remove all data until it doesn't exist anymore
#     ClickText             ${data}
#     ClickText             Delete
#     VerifyText            Are you sure you want to delete this lead?
#     ClickText             Delete                      2
#     VerifyText            Undo
#     VerifyNoText          Undo
#     ClickText             Leads                    partial_match=False