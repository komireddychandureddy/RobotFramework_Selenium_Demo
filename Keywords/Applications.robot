*** Settings ***
Resource          ../Config/super.robot

*** Keywords ***
Register new user
    [Arguments]    ${registration_data}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.register.firstname}    ${LONG_WAIT}    First Name Text field is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.Input Text    ${textbox.register.firstname}    ${registration_data}[Firstname]
    SeleniumLibrary.input text    ${textbox.register.lastname}    ${registration_data}[Lastname]
    SeleniumLibrary.Input Text    ${textbox.register.address}    ${registration_data}[Address]
    SeleniumLibrary.input text    ${textbox.register.email}    ${registration_data}[Email]
    SeleniumLibrary.input text    ${textbox.register.phone}    ${registration_data}[Phone]
    Select Gender    ${registration_data}[Gender]
    Select Hobbies checkboxes    ${registration_data}[Hobbies]
    Select Languages    ${registration_data}[Languages]
    SeleniumLibrary.Select From List By Label    ${dropdown.register.skill}    ${registration_data}[Skill]
    SeleniumLibrary.Select From List By Value    ${dropdown.register.country}    ${registration_data}[Country]
    Select Country    ${registration_data}[Search Country]
    SeleniumLibrary.Select From List By Value    ${dropdown.register.day}    ${registration_data}[Day]
    SeleniumLibrary.Select From List By Value    ${dropdown.register.month}    ${registration_data}[Month]
    SeleniumLibrary.Select From List By Value    ${dropdown.register.year}    ${registration_data}[Year]
    SeleniumLibrary.input text    ${textbox.register.password}    ${registration_data}[Password]
    SeleniumLibrary.input text    ${textbox.register.confirm_password}    ${registration_data}[ConfirmPassword]
    SeleniumLibrary.Choose File    ${textbox.register.choose_file}    ${IMPORT_PROFILE_FILE}
    SeleniumLibrary.Click Element    ${button.register.submit}

Select Gender
    [Arguments]    ${gender}
    SeleniumLibrary.Select Radio Button    ${radio.register.gender}    ${gender}

Select Hobbies checkboxes
    [Arguments]    ${hobbies}
    @{list_hobbie}    Split String    ${hobbies}    |
    FOR    ${hobbie}    IN    @{list_hobbie}
        Log    ${hobbie}
        ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //input[@value='${hobbie}']    ${LONG_WAIT}    ${hobbie} checkbox is not visible after waiting ${LONG_WAIT}
        Run Keyword If    ${status}==True    SeleniumLibrary.Select Checkbox    //input[@value='${hobbie}']
        Run Keyword If    ${status}==False    Fail and take screenshot    ${hobbie} checkbox is not visible after waiting ${LONG_WAIT}
    END

Select Languages
    [Arguments]    ${language}
    SeleniumLibrary.Click Element    ${textbox.register.languages}
    SeleniumLibrary.Click Element    //a[text()='${language}']
    SeleniumLibrary.Click Element    ${label.register.Languages}

Select Country
    [Arguments]    ${select_country}
    SeleniumLibrary.Click Element    ${dropdown.register.search_country}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.register.search_country}    ${LONG_WAIT}    Search country textbox is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.input text    ${textbox.register.search_country}    ${select_country}
    SeleniumLibrary.Wait Until Element Is Visible    //li[text()='${select_country}']    ${LONG_WAIT}    ${select_country} country is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.Click Element    //li[text()='${select_country}']

Navigate To Resgistration Page
    [Arguments]    ${email}
    Launch Browser and Navigates to URL    ${URL}    ${BROWSER_NAME}    ${REMOTE_WEB_EXECUTION}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.signup.email}    ${LONG_WAIT}    Email Text field is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.input text    ${textbox.signup.email}    ${email}
    SeleniumLibrary.Click Element    ${image.signup.entering}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.register.firstname}    ${LONG_WAIT}    First Name Text field is not visible after waiting ${LONG_WAIT}
