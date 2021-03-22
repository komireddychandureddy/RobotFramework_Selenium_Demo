*** Settings ***
Resource          ../Config/super.robot

*** Keywords ***
Login to Web Application
    [Arguments]    ${username}    ${password}
    Launch Browser and Navigates to URL    ${URL}    ${BROWSER_NAME}    ${REMOTE_WEB_EXECUTION}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.loginpage.username}    ${LONG_WAIT}    Username Text field is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.click element    ${button.loginpage.login}
    SeleniumLibrary.Input Text    ${textbox.loginpage.username}    ${username}
    SeleniumLibrary.input text    ${textbox.loginpage.password}    ${password}
    SeleniumLibrary.click element    ${button.loginpage.login}
    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${image.homepage.home}    ${LONG_WAIT}    Login failed after waiting ${LONG_WAIT}
    ${error_message}    Run Keyword If    ${status} == False    SeleniumLibrary.Get Text    ${label.loginpage.error_msg}
    Run Keyword If    ${status} == False    SeleniumLibrary.Capture Page Screenshot

Launch Browser and Navigates to URL
    [Arguments]    ${url}    ${browser_name}    ${remote_execution}=No
    Run Keyword If    '${REMOTE_WEB_EXECUTION}'=='Yes'    Launch Browser in Browserstack
    Run Keyword If    '${REMOTE_WEB_EXECUTION}'=='No'    Launch Browser    ${url}    ${browser_name}
    Delete All Cookies
    Maximize Browser Window
    SeleniumLibrary.Set Browser Implicit Wait    ${LONG_WAIT}

Fail and take screenshot
    [Arguments]    ${message}
    Capture Page Screenshot
    Fail    ${message}

Log out from Application
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.settings}    ${LONG_WAIT}    username is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.click element    ${button.homepage.settings}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.logout}    ${LONG_WAIT}    username is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.click element    ${button.homepage.logout}

Read TestData from Excel
    [Arguments]    ${testdata_file_path}    ${testcase_id}    ${sheet}
    ${TESTDATA}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${testdata_file_path}    ${testcase_id}    ${sheet}
    Set Global Variable    ${TESTDATA}

Select Value From Drop Down
    [Arguments]    ${dropdown_name}    ${dropdown_item}
    Javascript Click By Xpath    //label[text()="${dropdown_name}"]/..//div[@name or (@role='combobox' or @role='listbox')]
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()="${dropdown_name}"]/..//div[@name or (@role='combobox' or @role='listbox')]//span[text()="${dropdown_item}"]    ${LONG_WAIT}    ${dropdown_item} item is not visible after waiting ${LONG_WAIT}
    Javascript Click By Xpath    //label[text()="${dropdown_name}"]/..//div[@name or (@role='combobox' or @role='listbox')]//span[text()="${dropdown_item}"]

Navigate Edit Modules Page
    [Arguments]    ${xpath_edit}
    Wait Until Element Is Visible    //a[contains(@href, '/${xpath_edit}/edit')]    ${LONG_WAIT}    Edit button is not visible after waiting ${LONG_WAIT}
    Click Element    //a[contains(@href, '/${xpath_edit}/edit')]

Page Reload Until Element is Visible
    [Arguments]    ${locator}
    FOR    ${count}    IN RANGE    0    10
        ${page_status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${MEDIUM_WAIT}    Deals Title field is not visible after waiting ${MEDIUM_WAIT}
        Run Keyword If    ${page_status} == False    SeleniumLibrary.Reload Page
        ...    ELSE    Exit For Loop
    END
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${MEDIUM_WAIT}    Deals Title field is not visible after waiting ${MEDIUM_WAIT}

Launch Browser in Browserstack
    Log    Launching ${REMOTE_BROWSER_NAME} with ${URL} on Browserstack Cloud
    &{desiredCapabilities}    Create Dictionary    os=${REMOTE_OS}    os_version=${REMOTE_OS_VERSION}    browser=${REMOTE_BROWSER_NAME}    browser_version=${REMOTE_BROWSER_VERSION}
    Open Browser    ${URL}    remote_url=${REMOTE_SELENIUM_SERVER_URL}    desired_capabilities=${desiredCapabilities}

Launch Browser
    [Arguments]    ${url}    ${browser_name}
    Log    Launching ${browser_name} with ${url} on Local
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Run Keyword If    '${REMOTE_WEB_EXECUTION}'=='No' and '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Browser    ${url}    ${browser_name}    options=${options}
    Run Keyword If    '${REMOTE_WEB_EXECUTION}'=='No' '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Open Browser    ${url}    Firefox
    Run Keyword If    '${REMOTE_WEB_EXECUTION}'=='No' '${browser_name}'=='Edge' or '${browser_name}'=='edge'    Open Browser    ${url}    Edge    executable_path=${EXECDIR}\\Drivers\\msedgedriver.exe
