# RobotFramework_Selenium_Demo
Automation Sample web application using RobotFramework, Selenium, and Python

## Requirements

- Python 3.7 or greater

Download Python from https://www.python.org/ 

# Setup Environment variables
System variables
PYTHON_HOME=Path to Python 3+ folder

Add below in path variable under System Variables
%PYTHON_HOME%\Lib;%PYTHON_HOME%\DLLs;%PYTHON_HOME%\Lib\lib-tk;%PYTHON_HOME%\Scripts;

# Build project
Download or Clone the project and Navigate to RobotFramework_Selenium_Demo project directory

In order to build the project execute the following command in cmd or terminal

for Windows:

```
build.bat
```

for mac:
```
sh build.sh
```

# Execute testcases


In order to execute testcases the following command in cmd or terminal

```
RunUITests.bat
```

Note: update drivers based on your browser versions
Place all drivers in 'Python/Scripts' or 'Driver' Folders 

ChromeDriver: https://chromedriver.chromium.org/downloads

FirefoxDriver: https://github.com/mozilla/geckodriver/releases

MSEdgeDriver: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/

Used driver executable_path for Edge browser from Drivers folder.

For More https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser

# Remote Execution

For BrowserStack:
Add Username and KEY in remotevariables and enable remote_web_execution as Yes
Update Browser and Platform details based on requirement.

For More https://automate.browserstack.com/dashboard/v2/getting-started#

# References 

Practice Website: http://automationtesting.in/

Robotframework Metrics Reports: https://github.com/adiralashiva8/robotframework-metrics

Pabot: https://github.com/mkorpela/pabot -Parallel execution

Allure reports: https://github.com/allure-framework/allure-python/tree/master/allure-robotframework




