##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304K-DataTableandKeyCommand
# - Description: How to use key command in data table
#                - How to use key command in data table
# - Created date: 17/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304K-DataTableandKeyCommand

    Scenario: 0304K0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304K1 - Data Table management - How to use key command in data table

        #Open function by code
        Given the user opens the "CFGTCT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Response table"
        And the user writes "PTR" to the selected text field

        #Data table: create a new line
        Given the user selects the main fixed data table of the page

        #Data table: enter a value and hit tab key command
        When the user selects last fixed cell with header: "Code"
        Then the user adds the text "95@5.0" in selected cell
        And the user hits tab key in the selected cell

        #Data table: enter a value and hit enter key command
        When the user selects last fixed cell with header: "Code"
        Then the user adds the text "96@5.0" in selected cell
        And the user hits enter key in the selected cell

        #Data table: enter a value and hit escape key command
        When the user selects last fixed cell with header: "Code"
        Then the user adds the text "180@5.0" in selected cell
        And the user hits escape key in the selected cell

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304K2 - Logout scenario
        And the user logs-out from the system