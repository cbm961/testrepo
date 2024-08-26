###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304A-PredifinedDataTableManagement
# - Description: How to Interact with data table that are predifined
#                - Selection of the main data table of the page
#                - Selection of data table of section
#                - Selection of data table with x3 field name
# - Created date: 04/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304A-PredifinedDataTableManagement

    Scenario: 0304A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304A1 - Predifined Data Table management - How to select the main data table of the page and interact with it

        #Open function by code
        Given the user opens the "GESGCM" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Account core model"
        And the user writes "NA9" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field

        #Data table: select the main data table of the page
        Given the user selects the main data table of the page

        #Data table: row selection with column header name
        When the user selects row that has the text "Legal" in column with header: "General ledger type"

        #Data table: select a value in the selected drop down list of the selected row
        And the user selects cell with header: "Auto general ledger" of selected row
        And the user selects the choice "No" of the selected cell

        #Data table: enter a value in the selected text cell of the selected row and hits tab key
        And the user selects cell with header: "Ledger" of selected row
        And the user adds the text "NAS" in selected cell
        And the user selects cell with header: "Currency" of selected row
        And the user adds the text "USD" in selected cell and hits tab key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304A2 - Predifined Data Table management - How to select the data table of the section and interact with it

        #Open function by code
        Given the user opens the "GESGCM" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Account core model"
        And the user writes "NA9" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field

        #Data table: select the data table of the chosen section
        Given the user selects the data table of section: "Ledgers"

        #Data table: row selection with column header name
        When the user selects row that has the text "Legal" in column with header: "General ledger type"

        #Data table: select a value in the selected drop down list of the selected row
        And the user selects cell with header: "Auto general ledger" of selected row
        And the user selects the choice "No" of the selected cell

        #Data table: enter a value in the selected text cell of the selected row and hits enter key
        And the user selects cell with header: "Ledger" of selected row
        And the user adds the text "NAS" in selected cell
        And the user selects cell with header: "Currency" of selected row
        And the user adds the text "USD" in selected cell and hits enter key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304A3 - Predifined Data Table management - How to select the data table with X3 field name and interact with it

        #Open function by code
        Given the user opens the "GESGCM" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Account core model"
        And the user writes "NA9" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field

        #Data table: select the data table with X3 field name
        Given the user selects the data table with x3 field name: "GCM1_ARRAY_NBRLED"

        #Data table: row selection with X3 feld name (ScreenCode_FieldName)
        When the user selects row that has the text "Legal" in column with X3 field name: "GCM1_LEDTYP"

        #Data table: select a value in the selected drop down list of the selected row using X3 field name (ScreenCode_FieldName)
        And the user selects cell with X3 field name: "GCM1_CFMAUT" of selected row
        And the user selects the choice "No" of the selected cell

        #Data table: enter a value in the selected text cell of the selected row using X3 field name (ScreenCode_FieldName)
        And the user selects cell with X3 field name: "GCM1_LED" of selected row
        And the user adds the text "NAS" in selected cell
        And the user selects cell with X3 field name: "GCM1_CUR" of selected row
        And the user adds the text "USD" in selected cell

        #Validate the line entered.
        And the user hits enter

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304A4 - Logout scenario
        And the user logs-out from the system