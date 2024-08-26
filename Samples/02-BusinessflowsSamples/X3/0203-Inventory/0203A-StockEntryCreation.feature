###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0203A-StockEntryCreation
# - Description:
#       1) Create a stock entry
# - Created date: 24/06/2020
# - Updated date: 09/10/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0203A-StockEntryCreation

    Scenario: 0203A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0203A1 - Stock entry creation

        Given the user opens the "GESSMR" function

        #Select miscellenous receipt transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Misc Stock Receipts Full Entry" and column header: ""
        And the user clicks on the selected cell

        And the user dismisses the alert box

        Then the "Miscellaneous receipts ALL : Misc Stock Receipts Full Entry" screen is displayed

        #Entering in creation mode.
        When the user clicks the "New" main action button on the right panel

        #Enter header information
        Then the user selects the text field with name: "Stock site"
        And the user writes "ATP21" to the selected text field
        And the user selects the date field with name: "Allocation date"
        And the user writes a generated date in the selected date field using the value "T-1"

        #Enter stock lines information
        Given the user selects the fixed data table of section: "Lines"
        When the user selects last fixed cell with header: "Product"
        Then the user adds the text "BMS012" in selected cell
        And the user selects last editable cell with column header: "Quantity"
        And the user adds the text "100" in selected cell


        #Create the budget enveloppe
        Then the user clicks the "Create" main action button on the right panel

        #Close Print labels
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0203A2 - Logout scenario
        Then the user logs-out from the system