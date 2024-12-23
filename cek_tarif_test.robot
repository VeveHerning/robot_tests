*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           String

Suite Setup       Open Application
Suite Teardown    Close Application

*** Variables ***
${URL}            http://localhost:4723/wd/hub
${PLATFORM_NAME}  Android
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}    com.lionparcel.android
${APP_ACTIVITY}   com.lionparcel.android.MainActivity

${VALID_LOCATION_FROM}    Jakarta
${VALID_LOCATION_TO}      Surabaya
${INVALID_LOCATION}       InvalidCity
${WEIGHT}                 5

*** Keywords ***
Open Application
    Open Application    ${URL}    platformName=${PLATFORM_NAME}    
deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    
appActivity=${APP_ACTIVITY}

Input Valid Locations
    Input Text    id=com.lionparcel.android:id/location_from_input    
${VALID_LOCATION_FROM}
    Input Text    id=com.lionparcel.android:id/location_to_input      
${VALID_LOCATION_TO}

Input Invalid Locations
    Input Text    id=com.lionparcel.android:id/location_from_input    
${INVALID_LOCATION}
    Input Text    id=com.lionparcel.android:id/location_to_input      
${INVALID_LOCATION}

Input Weight
    Input Text    id=com.lionparcel.android:id/weight_input           
${WEIGHT}

Click Check Tarif
    Click Element    
id=com.lionparcel.android:id/check_tarif_button

Verify Success Message
    Wait Until Element Is Visible    
id=com.lionparcel.android:id/success_message
    Element Text Should Be           
id=com.lionparcel.android:id/success_message    Tarif successfully 
calculated!

Verify Error Message
    Wait Until Element Is Visible    
id=com.lionparcel.android:id/error_message
    Element Text Should Be           
id=com.lionparcel.android:id/error_message    Invalid locations 
entered.

*** Test Cases ***
Positive Case: Check Tarif With Valid Inputs
    Given I am on the Cek Tarif page
    When I input valid locations and weight
    And I click "Check Tarif"
    Then I see a success message with the calculated tarif

Negative Case: Check Tarif With Invalid Inputs
    Given I am on the Cek Tarif page
    When I input invalid locations and weight
    And I click "Check Tarif"
    Then I see an error message indicating invalid inputs

