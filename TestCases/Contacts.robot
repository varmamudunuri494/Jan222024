*** Settings ***
Resource              ../Common/TestCommon.robot
Documentation         New test suite
Library               QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library               String
Library               DateTime
Suite Setup           Open Browser                about:blank                 chrome
Suite Teardown        Close All Browsers

*** Test Cases ***
Entering A New Contact
    [Tags]            Contacts
    Appstate          Home
    LaunchApp         Sales
    ClickText         Contacts
    ClickUntil        New Contact                 New
    UseModal          On
    VerifyPicklist    Salutation                  Mr.
    TypeText          First Name                  Abhi
    TypeText          *Last Name                  Varma
    TypeText          Email                       abhivarma@gmail.com
    PickList          *Contact Currency           CAD - Canadian Dollar
    VerifyText        Address Information
    TypeText          Mailing Street              4th Lane
    TypeText          Mailing Country             Australia
    ClickText         Save                        partial_match=False
    UseModal          Off
    Sleep             3sf
    ClickText         Details