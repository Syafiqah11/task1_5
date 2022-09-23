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
    Click Element At Coordinates    //div[@id='dt_core_account-info_acc-info']    10    20 
    Wait Until Page Contains Element    //div[@id='dt_account_switcher_modal']   200
    Click Element    //li[@id='real_account_tab']
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    # List Selection Should Be    //div[@id='dt_core_account-switcher_demo-tab']

Buy Lower Contract
    Click Element    //div[@data-testid='dt_contract_dropdown']
    # Select From List By Value    //div[@id='dt_contract_rise_fall_item']    'rise_fall'
    Wait Until Page Contains Element    //div[@class='contract-type-dialog__wrapper']    50
    Click Element    //div[@id='dt_contract_high_low_item']
    Click Element    //div[@class='cq-menu-btn']
    Wait Until Page Contains Element    //div[@class='sc-mcd ']    50
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD']   200
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD']
    Click Element    //button[@id='dc_duration_toggle_item']
    Input Text    //input[@class='dc-input__field']    2
    Click Element    //button[@id='dc_payout_toggle_item']
    Input Text    //input[@class='dt_amount_input']    15.50
    Click Element    //button[@id='dt_purchase_put_button']