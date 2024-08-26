##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304G-DataTableandCellManagement
# - Description: How to interact with cells in data table
#                - How to enter a value or a value defined in a static parameter in a cell
#                - How to select cells
#                - How to check the content of a selected cell
# - Created date: 10/02/2020
# - Updated date: 21/06/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304G-DataTableandCellManagement

    Scenario: 0304G0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304G1 - Data Table management - How to enter a value or a value defined in a static parameter in a cell
        #Please note the parameter loginUserName used in this example is a parameter defined in the .\cucumber-conflig\parameters file.
        #If you need to work with stored value (using memory), please check the following sample:  0304P-DataTableandStoredValueManagement

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        When the user selects the main data table of the page
        And the user selects row that has the text "XATP" in column with header: "Login"
        And the user opens "Detail" function on toolbox of the selected row

        And the user clicks the "Edit" action button on the header drop down
        And the user clicks the "Administration" tab selected by title

        #Data table: select the data table of field
        Given the user selects the data table of field: "Endpoints login"
        When the user clicks the "Append" button in the left top bar of the selected data table

        #Data table: enter hardcoded value in the selected cell
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "XATP" in selected cell

        #Data table: enter value defined in parameter loginUserName in the selected cell
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "param:loginUserName" in selected cell

        #Data table: enter hardcoded value in the selected cell and hit tab key
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "XATP" in selected cell and hits tab key

        #Data table: enter value defined in parameter loginUserName in the selected cell and hit tab key
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "param:loginUserName" in selected cell and hits tab key

        #Data table: enter hardcoded value in the selected cell and hit enter key
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "XATP" in selected cell and hits enter key

        #Data table: enter value defined in parameter loginUserName in the selected cell and hit enter key
        Then the user selects last editable cell with column header: "X3 user code"
        And the user adds the text "param:loginUserName" in selected cell and hits enter key

        When the user open the main page clicking on the logo

        Then an alert box with the text "You have unsaved changes" appears
        And the user clicks the "Continue" option in the alert box


    Scenario: 0304G2 - Data Table management - How to select cells

        #Open function by code
        Given the user opens the "GESGAC" function

        #Select chart of account
        When the user clicks the "Chart" button in the header
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Code"
        And the user adds the text "NA1" in selected cell
        And the user hits enter
        And the user selects row that has the text "NA1" in column with header: "Code"
        And the user clicks on the selected row

        And the user clicks the "Management" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Variance accounts"

        #Data table: select cell with row number and verifying value
        When the user selects cell with column header: "Variance accounts" and row number: 2
        Then the value of the selected cell is "Debit balance increase"
        And the user takes a screenshot

        #Data table: select last cell and verifying value
        When the user selects last cell with column header: "Description"
        Then the value of the selected cell is ""
        And the user takes a screenshot

        #Data table: select cell with required value
        When the user selects cell with text: "Credit balance increase" and column header: "Variance accounts"
        Then the value of the selected cell is "Credit balance increase"
        And the user takes a screenshot

        #Data table: select cell that match exact text
        When the user selects cell that matches exact with the text: "Exchange gain" and column header: "Variance accounts"
        Then the value of the selected cell is "Exchange gain"
        And the user takes a screenshot

        #Data table: select cell that match exact text using X3 field name (ScreenCode_FieldName)
        When the user selects cell that matches exact with the text: "Credit balance decrease" and X3 field name: "GAC2_CNVACCDES"
        Then the value of the selected cell is "Credit balance decrease"
        And the user takes a screenshot

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304G3 - Data Table management - How to check the content of a selected cell

        #Open function by code
        Given the user opens the "GESGAC" function

        #Select chart of account
        When the user clicks the "Chart" button in the header
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Code"
        And the user adds the text "NA1" in selected cell
        And the user hits enter
        And the user selects row that has the text "NA1" in column with header: "Code"
        And the user clicks on the selected row

        And the user clicks the "Management" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Variance accounts"

        #Data table: select cell with required value
        When the user selects cell with text: "Exchange loss" and column header: "Variance accounts"
        And the user takes a screenshot

        #Data table: check the content of the cell matches the required value
        Then the value of the selected cell is "Exchange loss"
        And the user takes a screenshot

        #Data table: check the select cell is not empty
        Then the selected cell is not empty
        And the user takes a screenshot

        #Data table: check the select cell is not empty (other possibility)
        Then the value of the selected cell not is ""
        And the user takes a screenshot

        #Data table: select cell with row number and verifying value
        When the user selects cell with column header: "Account" and row number: 2
        And the user takes a screenshot

        #Data table: check the select cell is empty
        Then the selected cell is empty
        And the user takes a screenshot

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304G4 - Logout scenario
        And the user logs-out from the system