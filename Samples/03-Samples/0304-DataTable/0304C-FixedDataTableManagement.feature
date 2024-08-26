###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304C-FixedDataTableManagement
# - Description: How to Interact with the fixed part of the data table
#                - Selection of the main fixed data table of the page
#                - Selection of the fixed data table of section
#                - Selection of the fixed data table for x3 field name
# - Created date: 04/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304C-FixedDataTableManagement

    Scenario: 0304C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304C1 - Fixed Data Table management - How to select the main fixed data table of the page and interact with it

        #Open function by code
        Given the user opens the "GESGAS" function

        #Select transaction to enter in the function
        When the user selects the data table in the popup
        Then the user selects cell with text: "STDCO Column complete transaction" and column header: ""
        And the user clicks on the selected cell

        Then the "Journal entry STDCO : Column complete transaction" screen is displayed

        #Enter in creation mode
        When the user clicks the "New" main action button on the right panel

        #Entering header information
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Entry type"
        And the user writes "SPINV" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes today to the selected date field

        #Select Lines tab to enter line information
        When the user clicks the "Lines" tab selected by title

        #Data table: select the fixed part of the main data table of the page
        Given the user selects the main fixed data table of the page

        #Data table: enter value in the last fixed cell selected
        When the user selects last fixed cell with header: "Site"
        Then the user adds the text "ATP21" in selected cell

        #Data table: enter value in the last editable cell selected
        When the user selects last editable cell with column header: "Leg./Ana USA"
        Then the user adds the text "20100" in selected cell

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304C2 - Fixed Data Table management - How to select the fixed data table of the section and interact with it

        #Open function by code
        Given the user opens the "GESGAS" function

        #Select Transaction to enter in the function
        When the user selects the data table in the popup
        Then the user selects cell with text: "STDCO Column complete transaction" and column header: ""
        And the user clicks on the selected cell

        Then the "Journal entry STDCO : Column complete transaction" screen is displayed

        #Enter in creation mode
        When the user clicks the "New" main action button on the right panel

        #Entering header information
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Entry type"
        And the user writes "SPINV" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes today to the selected date field

        #Select Lines Tab to enter line information
        When the user clicks the "Lines" tab selected by title

        #Data table: select the fixed part of the data table chosen section
        Given the user selects the fixed data table of section: "Line"

        #Data table: enter value in the last fixed cell selected
        When the user selects last fixed cell with header: "Site"
        Then the user adds the text "ATP21" in selected cell

        #Data table: enter value in the last editable cell selected
        When the user selects last editable cell with column header: "Leg./Ana USA"
        Then the user adds the text "20100" in selected cell

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304C3 - Fixed Data Table management - How to select the fixed data table with X3 field name and interact with it

        #Open function by code
        Given the user opens the "GESGAS" function

        #Select transaction to enter in the function
        When the user selects the data table in the popup
        Then the user selects cell with text: "STDCO Column complete transaction" and column header: ""
        And the user clicks on the selected cell

        Then the "Journal entry STDCO : Column complete transaction" screen is displayed

        #Enter in creation mode
        When the user clicks the "New" main action button on the right panel

        #Entering header information
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Entry type"
        And the user writes "SPINV" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes today to the selected date field

        #Select Lines Tab to enter line information
        When the user clicks the "Lines" tab selected by title

        #Data table: select the fixed part of the data table selected with X3 field name
        Given the user selects the fixed data table for x3 field name: "WMAC2STDCO_ARRAY_NBLIG"

        #Data table: enter value in the last fixed cell selected with X3 field name (ScreenCode_FieldName)
        When the user selects last fixed cell with X3 field name: "WMAC2STDCO_FCYLIN"
        Then the user adds the text "ATP21" in selected cell

        #Data table: enter value in the last editable cell selected with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "WMAC2STDCO_ACC1"
        And the user adds the text "20100" in selected cell and hits enter key
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects last editable cell with X3 field name: "WMAC2STDCO_BPR"
        And the user adds the text "NA052" in selected cell and hits enter key

        #Data table: select fixed row by number and then select the fixed cell of the selected row
        Given the user selects the fixed data table for x3 field name: "WMAC2STDCO_ARRAY_NBLIG"
        When the user selects fixed table row number: 1
        And the user selects fixed cell with X3 field name: "WMAC2STDCO_FCYLIN" of selected row
        Then the value of the selected cell is "ATP21"

        #Data table: select fixed cell of a given row number
        When the user selects the fixed cell with X3 field name: "WMAC2STDCO_FCYLIN" and row number: 1
        Then the value of the selected cell is "ATP21"

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 034C4 - Logout scenario
        And the user logs-out from the system