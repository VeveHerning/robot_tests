*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
User Journey of Shopping Cart Checkout
    Given the user is on the Sauce Demo login page
    When the user enters valid credentials
    And the user adds an item to the cart
    And the user proceeds to checkout
    Then the user should see the order confirmation
    And the browser is closed

*** Keywords ***
Given the user is on the Sauce Demo login page
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=user-name    timeout=10

When the user enters valid credentials
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10

And the user adds an item to the cart
    Wait Until Page Contains Element    id=inventory_container    timeout=60
    Click Element    id=add-to-cart-sauce-labs-backpack  # Use the specific ID for the 
backpack
    Click Element    id=add-to-cart-sauce-labs-bike-light # Use the specific ID for the
bike light
    Wait Until Page Contains Element    id=shopping_cart_container    timeout=60

And the user proceeds to checkout
    Wait Until Page Contains Element    id=shopping_cart_container  timeout=60
    Click Element  id=shopping_cart_container
    Click Button   id=checkout
    Wait Until Page Contains Element    id=first-name    timeout=60
    Input Text    id=first-name    John
    Input Text    id=last-name    Doe
    Input Text    id=postal-code    12345
    Click Button   id=continue
    Wait Until Page Contains Element    id=checkout_summary_container    timeout=60

Then the user should see the order confirmation
    Wait Until Page Contains Element    id=finish    timeout=60

And the browser is closed
    Close Browser

