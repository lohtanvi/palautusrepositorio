*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application And Go To Starting Page

*** Test Cases ***
Click Login Link
    Click Link  Login
    Login Page Should Be Open

Click Register Link
    Click Link  Register new user
    Register Page Should Be Open

*** Keywords ***
Login
    Go To  ${LOGIN_URL} 

Register new user
    Go To  ${REGISTER_URL} 

Register Page Should Be Open
    Title Should Be  Register

*** Keywords ***
Reset Application And Go To Starting Page
  Reset Application
  Go To Starting Page

*** Keywords ***
Go To Starting Page
    Go To  ${HOME_URL}