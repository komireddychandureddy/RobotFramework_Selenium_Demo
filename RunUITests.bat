echo off
set source=%~dp0
set today=%Date:~0,2%_%Date:~3,2%_%Date:~6,8%
set t=%time:~0,8%
set t=%t::=%
set t=%t: =0%
set timestamp=%today%_%t%
echo %timestamp%
@echo "#######################################"
@echo "# Executing Demo UI Testcases #"
@echo "#######################################"
robot --logtitle Demo_UI_Regression_Report --reporttitle Demo_UI_Regression_Report --outputdir %source%\Results\UI_Reports KeywordTestcases\Web_Demo_Test_Suite.robot 