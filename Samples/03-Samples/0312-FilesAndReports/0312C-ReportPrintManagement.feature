##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0312C-ReportPrintManagement
# - Description: How to print a report
#                - How to print a report and check the tracker
# - Created date: 03/03/2020
# - Updated date: 18/01/2023
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0312C-ReportPrintManagement

    Scenario: 0312C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0312C1 - Report management - How to print a report and check the tracker

        #Open function by code
        Given the user opens the "AIMP" function
        And the user selects the text field with name: "Report code"
        And the user writes "BALGRP" to the selected text field and hits tab key

        Given the user selects the data table of section: "Parameters"

        #Enter company
        And the user selects row that has the text "Company" in column with header: "Parameter title"
        And the user selects cell with header: "First value" of selected row
        And the user adds the text "ATP2" in selected cell

        #Enter Date range
        And the user selects row that has the text "Date range" in column with header: "Parameter title"
        And the user selects cell with header: "First value" of selected row
        And the user enters the first day of the year in the selected cell
        And the user selects cell with header: "Final value" of selected row
        And the user enters the last day of the year in the selected cell

        And the user selects the text field with name: "Destination"
        And the user writes "PREVISU" to the selected text field and hits tab key

        Then the user clicks the "Print" secondary action button on the right panel

        #Print in progress
        Given the user waits for a report printout with message "Report available in storage area."

        #Tracker: check the information displayed on the tracker
        Then a tracker appears signalling completion
        Then the tracker has the job title "General balance"
        Then the tracker has the phase "Job finished"
        Then the tracker has the message "Report available in storage area"

        #Tracker: download the report
        And the user clicks "Download" button on the tracker

        #Tracker: dismiss the tracker
        And the user clicks to dismiss the tracker


        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0312C2 - Logout scenario
        And the user logs-out from the system