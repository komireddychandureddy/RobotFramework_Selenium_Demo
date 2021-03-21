*** Settings ***
Resource          ../Config/super.robot

*** Test Cases ***
TC_01 Validate new user is created
    [Setup]    common.Read TestData from Excel    ${TESTDATA_PATH}    TC_01    Web
    Comment    Navigate to resgistration screen
    Navigate To Resgistration Page    ${TESTDATA}[Email]
    Comment    Register new user demo
    Register new user    ${TESTDATA}
    [Teardown]    SeleniumLibrary.Close Browser
