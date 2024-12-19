*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem

*** Variables ***
${BASE_URL}      https://reqres.in/api
${GET_USER_ID}   2
${POST_USER_NAME}    John Doe
${POST_USER_JOB}     Developer

*** Test Cases ***
Get Single User
    [Documentation]    Verify that we can get a single user by ID
    ${response}=    GET Request    Get User    ${GET_USER_ID}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    User details: ${response.json()}

Post Create User
    [Documentation]    Verify that we can create a new user
    ${data}=    Create User Data
    ${response}=    POST Request    Create User    ${data}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    Created user: ${response.json()}

*** Keywords ***
GET Request
    [Arguments]    ${endpoint}    ${user_id}
    ${url}=    Set Variable    ${BASE_URL}/${endpoint}/${user_id}
    ${response}=    GET    ${url}
    [Return]    ${response}

POST Request
    [Arguments]    ${endpoint}    ${data}
    ${url}=    Set Variable    ${BASE_URL}/${endpoint}
    ${response}=    POST    ${url}    json=${data}
    [Return]    ${response}

Create User Data
    [Documentation]    Create a dictionary for the user data to be posted
    ${data}=    Create Dictionary    name=${POST_USER_NAME}    job=${POST_USER_JOB}
    [Return]    ${data}
