*** Variables ***
${USER}           \    # username of browserstack
${KEY}            \    # key of browserstack account
${REMOTE_WEB_EXECUTION}    No    # args can be: Yes for Remote Web and No for Local Web
${REMOTE_OS}      windows    # args can be: Windows, OS X
${REMOTE_OS_VERSION}    10    # args can be: 10, 8.1, 8, 7 XP for Windows and Big Sur, Catalina ... for Mac
${REMOTE_BROWSER_NAME}    chrome    # args can be: Chrome, Firefox, Edge, Safari, IE and Opera
${REMOTE_BROWSER_VERSION}    78    # args can be: Depends on browser
${REMOTE_SELENIUM_SERVER_URL}    https://${USER}:${KEY}@hub-cloud.browserstack.com/wd/hub
