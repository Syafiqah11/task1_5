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
    # Wait Until Page Contains Element    //div[@class='acc-switcher__list']   200
    Click Element    //li[@id='real_account_tab']
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    Click Element    //div[@id='dt_VRTC6756754'] 

Buy Rise Contract
    # Wait Until Page Co//div[@class='acc-switcher__list']ntains Element    //div[@data-testid='dt_contract_dropdown']    100
    # Click Element    //div[@data-testid='dt_contract_dropdown']
    # Select From List By Value    //div[@id='dt_contract_rise_fall_item']    'rise_fall'
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Page Contains Element    //div[@class='ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display stxMenuActive']    100
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V']   200
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V']
    Click Element    //button[@id='dc_stake_toggle_item']
    Select From List By Value    //input[@input='dt_duration_range_input']    5
    Input Text    //input[@id='dt_amount_input']    10
    Click Element    //button[@id='dt_purchase_call_button']