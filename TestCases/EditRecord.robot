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
    ClickCell       r2/c?Name                   tag=a
