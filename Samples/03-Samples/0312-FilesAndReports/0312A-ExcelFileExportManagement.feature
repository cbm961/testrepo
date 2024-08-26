##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0312A-ExcelFileExportManagement
# - Description: How to export an excel file
#                - How to export an excel file
# - Created date: 02/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0312A-ExcelFileExportManagement

    Scenario: 0312A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0312A1 - File management - How to export an excel file

        #Open function by code
        Given the user opens the "CONSBAL" function

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field

        Then the user clicks the "Search" button in the header

        #Execute excel export function from the header drop down
        Then the user opens the header drop down
        And the user opens the "Inquiry export" section on the right panel
        And the user clicks the "Excel export" secondary action button on the right panel

        #Then the modal dialog "Excel export" is displayed
        And the user clicks the "Export" secondary action button on the right panel
        And the user selects the icon field with X3 field name: "AEXP8_EXPEXC"
        And the user clicks on the selected icon field

        #File: check the name of the file exported
        Then the output file "Account balance inquiry.xlsx" is created

        #Close the export modal dialog
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0312A2 - Logout scenario
        And the user logs-out from the system