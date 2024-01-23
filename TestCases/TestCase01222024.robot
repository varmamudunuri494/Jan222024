*** Settings ***
Documentation     New test suite
Library           QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library           String
Library           DateTime
Suite Setup       Open Browser                about:blank                 chrome
Suite Teardown    Close All Browsers
Resource          ../Resources/TestCommon.robot

*** Test Cases ***
Entering A New Book
    [Tags]        Books
    Appstate      Home
    LaunchApp     Sales
    ClickText     More
    ClickText     Books
    ClickUntil    New Book                    New
    ClickText     New
    UseModal      On
    TypeText      *Book Name                  GOT7905
    TypeText      Book ID                     W467
    TypeText      Date                        02/12/2023                  anchor=Book ID
    PickList      Currency                    CAD - Canadian Dollar
    PickList      Genre of Book               History
    TypeText      Number of Copies            15
    TypeText      Author                      Ayanshvarma
    VerifyText    System Information
    PickList      Request To                  Viz
    TypeText      Title                       GMC
    TypeText      Directions                  Take Left and go right
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Details
    VerifyText    GOT7905