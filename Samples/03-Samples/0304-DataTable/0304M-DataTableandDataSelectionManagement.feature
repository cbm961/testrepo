##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304M-DataTableandDataSelectionManagement
# - Description: How to select data in a data table
#                - How to select data in a data table
# - Created date: 05/03/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304M-DataTableandDataSelectionManagement

    Scenario: 0304M0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304M1 - Data Table management - How to select data in a data table

        #Open Sales order function
        Given the user opens the "GESPJCC" function
        Then the "Cost type" screen is displayed

        And the user selects the text field with name: "Cost group"
        And the user writes "DEFAULT" to the selected text field and hits tab key

        #Data selection: method 1
        Given the user clicks the "Selection" button on the "Unit" text field
        When the user selects the data table in the popup
        Then the user clicks on the cell that matches exact with the text "Hour" in cell with header: "Description"

        #Data selection: method 2
        Given the user clicks the "Selection" button on the "Unit" text field
        When the user selects the data table in the popup
        Then the user clicks on the cell that has the text "Day 4H" in cell with header: "Description"

        #Data selection: method 3
        Given the user clicks the "Selection" button on the "Unit" text field
        When the user selects the data table in the popup
        Then the user selects search cell with header: "Unit"
        And the user adds the text "J8H" in selected cell and hits enter key
        And the user selects cell with column header: "Unit" and row number: 1
        And the user clicks on the selected cell

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303M2 - Logout scenario
        And the user logs-out from the system