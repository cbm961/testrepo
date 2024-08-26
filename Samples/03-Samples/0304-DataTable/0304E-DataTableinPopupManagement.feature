##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304E-DataTableinPopupManagement
# - Description: How to interact with data table in popup
#                - Selection of the data table in the popup
#                - Selection of the fixed data table in the popup
# - Created date: 10/02/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0304E-DataTableinPopupManagement

    Scenario: 0304E0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304E1 - Data Table management - How to interact with data table in popup

        #Open function by code
        Given the user opens the "UTICLOPER" function

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key

        #Data table: data table interaction in a popup
        Given the user selects the data table in the popup
        And the user selects cell with column header: "Ledger type" and row number: 1
        Then the value of the selected cell is "Legal"

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304E2 - Data Table management - How to interact with fixed data table in popup

        #Open function by code
        Given the user opens the "REQAPP" function

        And the user selects the text field with name: "Company/site"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field
        And the user selects the icon field with name: "Display/Refresh"
        And the user clicks on the selected icon field

        #Data table: fixed data table interaction in a popup
        Given the user selects the fixed data table in the popup
        And the user selects first row of the selected data table
        And the user selects cell with header: "Level" of selected row
        Then the selected cell is not empty

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304E3 - Logout scenario
        And the user logs-out from the system