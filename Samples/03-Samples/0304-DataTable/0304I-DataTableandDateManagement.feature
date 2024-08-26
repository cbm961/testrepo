##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304I-DataTableandDateManagement
# - Description: How to manage date in data table
#                - How to interact with date in data table
#                - Miscellaneous date management in data table
# - Created date: 10/02/2020
# - Updated date: 10/02/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304I-DataTableandDateManagement

    Scenario: 0304I0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304I1 - Data Table management - How to interact with date in data table

        #Open function by code
        Given the user opens the "GESTVT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Tax"
        And the user writes "NA099" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "USA Normal VAT" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "USA NOR" to the selected text field

        #Data table: select main table to the page
        Given the user selects the main data table of the page

        #Date cell: entering & verifying value - Today's date
        When the user selects last editable cell with column header: "Start date"
        Then the user enters todays date in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is todays date
        And the user takes a screenshot

        #Date cell: entering & verifying value - Tomorrow's date
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "T+1" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "T+1"
        And the user takes a screenshot

        #Date cell: entering & verifying value - Yesterday's date
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "T-1" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "T-1"
        And the user takes a screenshot

        #Date cell: entering & verifying value - n day after today with n=3
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "T+3" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "T+3"
        And the user takes a screenshot

        #Date cell: entering & verifying value - n day before today with n=3
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "T-3" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "T-3"
        And the user takes a screenshot

        #Date cell: entering & verifying value - First day of the current month
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the first day of the month in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the first day of the month
        And the user takes a screenshot

        #Date cell: entering & verifying value - Last day of the current month
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the last day of the month in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the last day of the month
        And the user takes a screenshot

        #Date cell: entering & verifying value - n month after today with n=2
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the first day of the month in the selected cell and adjusts by "M+2"
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the first day of the month adjusted by "M+2"
        And the user takes a screenshot

        #Date cell: entering & verifying value - First day of the current year
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the first day of the year in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the first day of the year
        And the user takes a screenshot

        #Date cell: entering & verifying value - Last day of the current year
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the last day of the year in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the last day of the year
        And the user takes a screenshot

        #Date cell: entering & verifying value - n years after today with n=2
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "Y+2" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "Y+2"
        And the user takes a screenshot

        #Date cell: entering & verifying value - n years before today with n=2
        When the user selects last editable cell with column header: "Start date"
        Then the user enters a generated date using the value "Y-2" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is a generated date using value "Y-2"
        And the user takes a screenshot

        #Date cell: entering & verifying value - First Day of the next month
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the first day of the month in the selected cell and adjusts by "M+1"
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the first day of the month adjusted by "M+1"
        And the user takes a screenshot

        #Date cell: entering & verifying value - Last Day of the next month
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the last day of the month in the selected cell and adjusts by "M+1"
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the last day of the month adjusted by "M+1"
        And the user takes a screenshot

        #Date cell: entering & verifying value - First Day of the next year
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the first day of the year in the selected cell and adjusts by "Y+1"
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the first day of the year adjusted by "Y+1"
        And the user takes a screenshot

        #Date cell: entering & verifying value - Last Day of the previous year
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the last day of the year in the selected cell and adjusts by "Y+1"
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the last day of the year adjusted by "Y+1"
        And the user takes a screenshot

        #Date cell: 1st Monday from Today
        #Value can be 1st 2nd 3rd 4th, Monday Tuesday, Wednesday until Sunday
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the "1st Monday" from today in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the "1st Monday" from today
        And the user takes a screenshot

        #Date cell: 3rd Tuesday + 4 days from Today
        #Value can be 1st 2nd 3rd 4th, Monday Tuesday, Wednesday until Sunday
        When the user selects last editable cell with column header: "Start date"
        Then the user enters the "3rd Tuesday +4" from today in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Start date"
        Then the value of the selected cell is the "3rd Tuesday +4" from today
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304I2 - Data Table management - Miscellaneous date management in data table

        #Open function by code
        Given the user opens the "GESCOE" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field
        And the user selects the text field with name: "Table reference"
        And the user writes "XREV1" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Revaluation coeff" to the selected text field

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Coefficients"

        #Date cell: returning current month & verifying value
        When the user selects last editable cell with column header: "Months"
        Then the user enters the month in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Months"
        Then the value of the selected cell is the current month
        And the user takes a screenshot
        And the user hits escape

        #Date cell: returning current year & verifying value
        When the user selects last editable cell with column header: "Year"
        Then the user enters the year in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Year"
        Then the value of the selected cell is the current year
        And the user takes a screenshot
        And the user hits escape

        #Date cell: returning current tax year & verifying value
        When the user selects last editable cell with column header: "Year"
        Then the user enters the current tax year starting "2020" in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Year"
        Then the value of the selected cell is the current tax year starting "2020"
        And the user takes a screenshot
        And the user hits escape

        #Date cell: returning current day & verifying value
        When the user selects last editable cell with column header: "Year"
        Then the user enters the day in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Year"
        Then the value of the selected cell is the current day
        And the user takes a screenshot
        And the user hits escape

        #Date cell: returning current week number & verifying value
        When the user selects last editable cell with column header: "Year"
        Then the user enters the week number in the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Year"
        Then the value of the selected cell is the current week number
        And the user takes a screenshot
        And the user hits escape

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304I3 - Logout scenario
        And the user logs-out from the system