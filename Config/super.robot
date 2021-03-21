*** Settings ***
Library           SeleniumLibrary    run_on_failure=SeleniumLibrary.CapturePageScreenshot
Library           FakerLibrary
Library           String
Library           Collections
Library           Screenshot
Library           DateTime
Library           ../Library/CustomLibrary.py
Resource          common_variables.robot
Resource          web_variables.robot
Resource          remote_variables.robot
Resource          ../Keywords/common.robot
Resource          ../Keywords/Applications.robot
Resource          ../ObjectRepository/buttons.robot
Resource          ../ObjectRepository/dropdowns.robot
Resource          ../ObjectRepository/images.robot
Resource          ../ObjectRepository/label.robot
Resource          ../ObjectRepository/textboxes.robot
Resource          ../ObjectRepository/checkboxes.robot
Resource          ../ObjectRepository/radiobuttons.robot
