*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page

*** Test Cases ***

Register With Valid Username And Password
    Set Username  julle
    Set Password  julle123
    Set Password_confirmation  julle123
    Submit Credentials
    Register Should Succeed

Register With Too Short Username And Valid Password
    Set Username  jl
    Set Password  jllle123
    Set Password_confirmation  jllle123
    Submit Credentials
    Register Should Fail With Message  Too Short Username

Register With Valid Username And Too Short Password
    Set Username  jille
    Set Password  jille33
    Set Password_confirmation  jille33
    Submit Credentials
    Register Should Fail With Message  Too Short or Invalid Password

Register With Valid Username And Invalid Password
    Set Username  jille
    Set Password  jilleeee
    Set Password_confirmation  jilleeee
    Submit Credentials
    Register Should Fail With Message  Too Short or Invalid Password

Register With Nonmatching Password And Password Confirmation
    Set Username  jille
    Set Password  jille123
    Set Password_confirmation  jille456
    Submit Credentials
    Register Should Fail With Message  Nonmatching passwords


Register With Username That Is Already In Use
    Set Username  kalle
    Set Password  jille123
    Set Password_confirmation  jille123
    Submit Credentials
    Register Should Fail With Message  User with username kalle already exists

Login After Successful Registration
    Set Username  jaana
    Set Password  jaana123
    Set Password_confirmation  jaana123
    Submit Credentials
    Register Should Succeed
    Click Link  ohtu
    Click Button  Logout
    Set Username  jaana
    Set Password  jaana123
    Click Button  Login
    Login Should Succeed

Login After Failed Registration
    Set Username  jille
    Set Password  jille123
    Set Password_confirmation  jille456
    Submit Credentials
    Click Link  Login
    Set Username  kalle
    Set Password  kalle123
    Click Button  Login
    Login Should Succeed

*** Keywords ***
Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password_confirmation
    [Arguments]  ${password_confirmation}
    Input Password  password_confirmation  ${password_confirmation}

Submit Credentials
    Click Button  Register

Register Should Succeed
    Welcome Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Register Page Should Be Open
    Title Should Be  Register
    
*** Keywords ***
Reset Application Create User And Go To Register Page
    Reset Application
    Create User  kalle  kalle123
    Go To  ${REGISTER_URL}

*** Keywords ***
Welcome Page Should Be Open
    Title Should Be  Welcome to Ohtu Application!

Login Should Succeed
    Main Page Should Be Open