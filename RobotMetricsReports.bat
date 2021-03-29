echo off
set source=%~dp0
set today=%Date:~0,2%_%Date:~3,2%_%Date:~6,8%
set t=%time:~0,8%
set t=%t::=%
set t=%t: =0%
set timestamp=%today%_%t%
echo %timestamp%
@echo "#######################################"
@echo "# Generating Demo UI Reports #"
@echo "#######################################"
robotmetrics --inputpath %source%\Results\UI_Reports --output output.xml --log log.html
