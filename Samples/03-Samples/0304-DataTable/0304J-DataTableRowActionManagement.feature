##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304J-DataTableRowActionManagement
# - Description: How to use row action
#                - How to insert or delete lines in data table using the row function on toolbox
#                - How to delete lines in data table using delete main action
# - Created date: 11/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304J-DataTableRowActionManagement

    Scenario: 0304J0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304J1 - Data Table management - How to insert or delete lines in data table using the row function on toolbox

        #Open function by code
        Given the user opens the "GESPRS" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Structure code"
        And the user writes "PU001" to the selected text field

        #Data table: create a new line
        And the user selects the main fixed data table of the page
        And the user selects last fixed cell with header: "Description"
        And the user adds the text "Discount2" in selected cell
        And the user selects last fixed cell with header: "Short description"
        And the user adds the text "Discount2" in selected cell and hits enter key

        #Data table: insert a line using toolbox action of the selected row
        Given the user selects the main fixed data table of the page
        When the user selects row that has the text "Discount2" in column with header: "Description"

        #Row action: insert a new line
        And the user opens "Insert" function on toolbox of the selected row

        #Data table: select the empty line inserted
        And the user selects table row that is above the currently selected row
        And the user selects cell with header: "Description" of selected row
        And the user adds the text "Discount1" in selected cell
        And the user selects cell with header: "Short description" of selected row
        And the user adds the text "Discount1" in selected cell and hits enter key

        #Data table: select the line below the previous line selected
        And the user selects table row that is below the currently selected row

        #Row action: delete the selected line
        And the user opens "Delete" function on toolbox of the selected row

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304J2 - Data Table management - How to delete lines in data table using delete main action

        #Open function by code
        Given the user opens the "GESADI" function

        And the user selects the text field with name: "Table"
        And the user writes "40" to the selected text field and hits enter key

        #Data table: select the required row in the data table
        Given the user selects the fixed data table of section: "List of values"
        When the user selects row that has the text "100" in column with header: "Code"
        Then the user highlights the selected row

        #Delete the selected row
        And the user clicks the "Delete" main action button on the right panel

        #Cancel the deletion
        And the user clicks "Close" button on the confirmation dialog

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304J3 - Logout scenario
        Then the user logs-out from the system