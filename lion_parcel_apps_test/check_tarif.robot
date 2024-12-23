*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  14
${DEVICE_NAME}    Android Emulator
${APP}           ${CURDIR}/path/to/your/app.apk

*** Test Cases ***
User  Can Access Cek Tarif Menu
    [Documentation]    Verify that the user can access the Cek Tarif menu successfully.
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    
platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Cek Tarif"]    timeout=10
    Click Element    xpath=//android.widget.TextView[@text="Cek Tarif"]
    Page Should Contain Element    xpath=//android.widget.TextView[@text="Masukkan Detail Pengiriman"]
    Close Application

User  Cannot Access Cek Tarif Menu Without Login
    [Documentation]    Verify that the user cannot access the Cek Tarif menu without logging in.
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    
platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Cek Tarif"]    timeout=10
    Click Element    xpath=//android.widget.TextView[@text="Cek Tarif"]
    Page Should Contain Element    xpath=//android.widget.TextView[@text="Silakan Login Terlebih 
Dahulu"]
    Close Application
