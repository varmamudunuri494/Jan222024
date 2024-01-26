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
    ClickText       Edit\ Reports\ To           timeout=20
    ClickText       Search Contacts...
    ClickText       New Contact                 anchor=Recent Contacts
    UseModal        On
    PickList        Salutation                  Ms.
    TypeText        First Name                  Swathi
    TypeText        Last Name                   Sharma
    PickList        Contact Currency            CAD - Canadian Dollar
    ClickText       Save                        anchor=Contact Information
    UseModal        Off
    TypeText        Phone                       8956232563
    ClickText       Save
