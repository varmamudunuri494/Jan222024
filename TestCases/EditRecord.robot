*** Settings ***
Resource            ../Common/TestCommon.robot
Documentation       New test suite
Library             QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library             String
Library             DateTime
Suite Setup         Open Browser                about:blank                 chrome
Suite Teardown      Close All Browsers

*** Test Cases ***
Eidting A Contact
    [Tags]          Contacts
    Appstate        Home
    LaunchApp       Sales
    ClickText       Contacts
    ClickItem       Select a List View: Contacts
    ClickElement    (//span[text()\='Recently\ Viewed'])                    timeout=20
    UseTable        Item Number
    ClickCell       r?Abhi\ Varma/c?Name        tag=a                       timeout=20
    ClickText       Details
    ClickText       Edit\ Name                  timeout=20
    PickList        Lead Source                 Web                         timeout=20
    VerifyText      Other Address               timeout=20
    TypeText        Other Country               United Arab Emirates        timeout=20
    TypeText        Reports To                  Varma                       timeout=20
    ClickText       Save                        partial_match=False
    UseModal        Off
    Sleep           3s