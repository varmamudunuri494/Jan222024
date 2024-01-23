*** Settings ***
Documentation     New test suite
Library           QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library           String
Library           DateTime
Suite Setup       Open Browser                about:blank                 chrome
Suite Teardown    Close All Browsers
Resource          ../Common/TestCommon.robot

*** Test Cases ***
Entering A New Contact
    [Tags]        Contacts
    Appstate      Home
    LaunchApp     Sales
    ClickText     Contacts
    ClickText     New
    ClickUntil    New Contact                 New
    UseModal      On
    PickList      Salutation                  Mr.
    TypeText      First Name                  Mahe
    TypeText      *Last Name                  Varma
    TypeText      Email                       varma@gmail.com
    PickList      *Contact Currency           CAD - Canadian Dollar
    VerifyText    Address Information
    TypeText      Mailing Street              1st Lane
    TypeText      Mailing Country             USA
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Details