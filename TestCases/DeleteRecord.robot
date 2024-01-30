*** Settings ***
Resource            ../Common/TestCommon.robot
Documentation       New test suite
Library             QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library             String
Library             DateTime
Suite Setup         Open Browser                about:blank                 chrome
Suite Teardown      Close All Browsers

*** Test Cases ***
Entering A New Contact
    [Tags]          Contacts
    Appstate        Home
    LaunchApp       Sales
    ClickText       Contacts
    ClickItem       Select a List View: Contacts
    ClickElement    (//span[text()\='Recently\ Viewed'])                    timeout=20
    UseTable        Item Number
    ${row}          GetTableRow                        Shan\ Sharma
    ClickCell       r?Shan\ Sharma/c?Name      Show\ 3\ more\ actions         timeout=20
    ClickText       Delete
    VerifyText      Are\ you\ sure\ you\ want\ to\ delete\ this\ contact?
    ClickText       Delete                      partial_match=False
    Sleep           3s