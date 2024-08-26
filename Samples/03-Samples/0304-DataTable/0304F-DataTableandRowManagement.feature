##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304F-DataTableandRowManagement
# - Description: How to select rows in a data table
#                - How to set number of rows to display
#                - How to verify the number of rows returned in a data table
#                - How to select rows and search for a specifc value
#                - How to interact with editable rows
# - Created date: 10/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304F-DataTableandRowManagement

    Scenario: 0304F0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304F1 - Data Table management - How to set number of rows to display

        #Open function by code
        Given the user opens the "GESCOA" function

        And the user selects the text field with name: "Chart code"
        And the user writes "NA1" to the selected text field and hits tab key
        And the user clicks the "Miscellaneous accounts" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Miscellaneous accounts"

        #Data table: set numbers of rows to display
        And the user sets rows to display to 50

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304F2 - Data Table management - How to verify the number of rows returned in a data table

        #Open function by code
        Given the user opens the "GESCOA" function

        And the user selects the text field with name: "Chart code"
        And the user writes "NA1" to the selected text field and hits tab key
        And the user clicks the "Miscellaneous accounts" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Miscellaneous accounts"

        #Data table: verify the number of rows returned in the data table
        Then the number of rows returned in the selected data table is "18 Results"

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304F3 - Data Table management - How to select rows and search for a specifc value

        #Open function by code
        Given the user opens the "GESCOA" function

        And the user selects the text field with name: "Chart code"
        And the user writes "NA1" to the selected text field and hits tab key
        And the user clicks the "Miscellaneous accounts" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Miscellaneous accounts"

        #Data table: select first row
        When the user selects first row of the selected data table

        #Data table: check a value exist in the selected row
        Then the user checks if there is value: "99999" in the selected row
        And the user clicks on the selected row

        #Data table: select last row
        When the user selects last row of the selected data table
        Then the user clicks on the selected row

        #Data table: select row by multiple criteria
        When the user selects row by multiple criteria that has the text "Debit balance decrease" in column with header: "Miscellaneous accounts" and the text "81500" in column with header: "Account"
        Then the user clicks on the selected row

        #Data table: select row by multiple criteria and by X3 field name (ScreenCode_FieldName)
        When the user selects row by multiple criteria that has the text "Credit balance decrease" in column with X3 field name: "COA2_ACCDES" and the text "81500" in column with X3 field name: "COA2_ACCMIS"
        Then the user clicks on the selected row

        #Data table: select row using column index
        When the user selects row that has the text "Exchange loss" in column with index: "CA2"
        When the user clicks on the selected row

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304F4 - Data Table management - How to interact with editable rows

        #Open function by code
        Given the user opens the "GESCOA" function

        And the user selects the text field with name: "Chart code"
        And the user writes "NA1" to the selected text field and hits tab key
        And the user clicks the "Reciprocal accounts" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Reciprocal accounts"

        #Data table: select editable row and write value
        When the user selects editable row that has the text "NA011" in column with header: "Site 1"
        Then the user edits text to "NA013" for cell with header: "Site 2" of selected row

        #Data table: select editable row by X3 field name (ScreenCode_FieldName) and write value
        When the user selects editable row that has the text "NA011" in column with X3 field name: "COA3_FCY1"
        Then the user edits text to "NA012" for cell with X3 field name: "COA3_FCY2" of selected row

        #Data table: select editable row by X3 field name (ScreenCode_FieldName) and write value and hits enter
        When the user selects editable row that has the text "NA011" in column with X3 field name: "COA3_FCY1"
        Then the user edits text to "NA013" for cell with X3 field name: "COA3_FCY2" of selected row and hits enter

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304F5 - Logout scenario
        And the user logs-out from the system