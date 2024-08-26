##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0312B-CsvFileExportManagment
# - Description: How to export a csv file
#                 - How to export a csv file in X3 Classic function
#                 - How to export a csv file in X3 Syracuse function
# - Created date: 02/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0312B-CsvFileExportManagment

    Scenario: 0312B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0312B1 - File management - How to export a csv file in X3 Classic function

        #Open function by code
        Given the user opens the "CONSCSI" function

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field

        Then the user clicks the "Search" button in the header

        #Execute csv export function from the header drop down
        Then the user opens the header drop down
        And the user opens the "Inquiry export" section on the right panel
        And the user clicks the "CSV export" secondary action button on the right panel

        #File: check the name of the file exported
        Then the output file "*.csv" is created

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0312B2 - File management - How to export a csv file in X3 Syracuse function

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        #Execute csv export function from the Excel report panel
        When the user opens the header drop down
        Then the user clicks the "Excel report" action button on the header drop down

        And an alert box with the text "Have you installed the most recent Sage X3 add-in for Office?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the modal dialog "Excel report" is displayed
        And the user selects the radio buttons group with name: "Excel report"
        And the user clicks on "Create CSV" radio button of the selected radio buttons group
        And the user clicks the "Ok" button in the header

        #File: Export the list of users
        Then the output file "user - user.csv" is created


    Scenario: 0312B3 - Logout scenario
        And the user logs-out from the system