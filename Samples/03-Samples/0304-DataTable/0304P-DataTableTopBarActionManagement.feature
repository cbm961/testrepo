##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304P-DataTableTopBarActionManagement
# - Description: How to interact with the left or right top bar button or actions of the data table
#                - How to interact with the left top bar actions of the data table
#                - How to interact with left top bar append button in a syracuse data table
#                - How to interact with the right top bar buttons of the syracuse data table
#                - How to interact with the right top bar buttons of the data table
# - Created date: 05/11/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304P-DataTableTopBarActionManagement

    Scenario: 0304P0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304P1 - Data Table management - How to interact with the left top bar actions of the data table

        #Open function by code
        Given the user opens the "CONSBAL" function

        #Check the function is opened
        Then the "Account balance inquiry" screen is displayed

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field

        And the user clicks the "Search" button in the header

        #Data table: execute the action Excel export in the left top bar of the selected data table
        And the user selects the data table of section: "Details"
        When the user clicks the "Excel export" action in the left top bar of the selected data table

        #waits for the confirmation message to disappear
        And the user waits 10 seconds

        And the modal dialog "Excel export" is displayed
        And the user clicks the "Export" button in the header
        And the user selects the icon field with X3 field name: "AEXP8_EXPEXC"
        And the user clicks on the selected icon field

        #File: check the name of the file exported
        Then the output file "Account balance inquiry.xlsx" is created

        #Close the export window
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304P2 - Data Table management - How to interact with left top bar append button in a syracuse data table

        #Open function by code
        Given the user opens the "Users" function

        #Check the function is opened
        Then the "Users" screen is displayed

        Given the user clicks the "New user" action button on the header drop down
        And the user selects the text field with name: "Login"
        And the user writes "ADMC2" to the selected text field

        And the user clicks the "Administration" tab selected by title

        #Data table: select the data table of field and click the Append button in the left top bar
        Given the user selects the data table of field: "Endpoints login"
        When the user clicks the "Append" button in the left top bar of the selected data table

        #Enter the required data in the data table
        And the user selects last editable cell with column header: "Endpoint"
        And the user clicks the "Selection" action button of the selected cell
        And the user selects the data table in the popup
        And the user selects cell that matches exact with the text: "Local development" and column header: "Description"
        And the user clicks on the selected cell

        #Cancel the modification
        When the user open the main page clicking on the logo
        Then an alert box with the text "You have unsaved changes" appears
        And the user clicks the "Continue" opinion in the alert box


    Scenario: 0304P3 - Data Table management - How to interact with the right top bar buttons of the syracuse data table

        #Open the entity
        Given the user opens the "Roles" entity

        #Check the function is opened
        Then the "Roles" screen is displayed

        #Data table: select the main data table
        And the user selects the main data table of the page

        #Data table: go to the next page
        When the user clicks the "Next" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: go to the previous page
        When the user clicks the "Previous" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: go to the last page
        When the user clicks the "Last" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: go to the first page
        When the user clicks the "First" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: go to page 3
        When the user clicks the "3" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: refresh the data table
        When the user clicks the "Refresh" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: maximize the data table
        When the user clicks the "Maximize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: minimize the data table
        When the user clicks the "Minimize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user open the main page clicking on the logo


    Scenario: 0304P4 - Data Table management - How to interact with the right top bar buttons of the data table

        #Open function by code
        Given the user opens the "CONSBAL" function

        #Check the function is opened
        Then the "Account balance inquiry" screen is displayed

        And the user selects the text field with name: "Company"
        And the user writes "NA10" to the selected text field and hits tab key

        And the user clicks the "Search" button in the header

        #Data table: select the data table
        And the user selects the data table of section: "Details"

        #Data table: go to page 2
        When the user clicks the "2" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: go to page 1
        When the user clicks the "1" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: maximize the data table
        When the user clicks the "Maximize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Data table: minimize the data table
        When the user clicks the "Minimize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario: 0304P5 - Logout scenario
        And the user logs-out from the system