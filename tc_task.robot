*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${login_email}    //input[@type='email']
${login_password}    //input[@type='password']
${submit_button}    //button[@type='submit']

*** Test Cases ***
Login to Deriv
    Open Browser    https://app.deriv.com/    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    ${login_button}
    Wait Until Page Contains Element    ${login_email}    10
    Input Text    ${login_email}    nurul.syafiqah+555@besquare.com.my
    Input Text    ${login_password}    abcdE123^^*
    Click Element    ${submit_button}
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Check Real/Virtual Account
    Wait Until Page Does Not Contain    //*[@aria-label='Loading interface...']
    Click Element At Coordinates    //div[@id='dt_core_account-info_acc-info']    10    20 
    Wait Until Page Contains Element    //li[@id='dt_core_account-switcher_demo-tab']   200
    Click Element    //li[@id='real_account_tab']
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    Click Element    //div[@id='dt_VRTC6756754'] 
