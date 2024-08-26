###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314K-DataTableCellStateVerification
# - Description: How to check the state of a cell in a data table
#                - How to check a cell is enabled or disabled
#                - How to check a data table column header is displayed or hidden
#                - How to verify the value of the choice of the selected cell is displayed or hidden
# - Created date: 23/09/2021
# - Updated date: 16/01/2024
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314K-DataTableCellStateVerification

    Scenario: 0314K0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: 0314K1 - Data Table management - How to check a cell is enabled or disabled

        #Open function by code
        Given the user opens the "GESGAC" function

        #Select chart of account
        And the user clicks the "Chart" button in the header
        And the user selects the data table in the popup
        And the user selects search cell with header: "Code"
        And the user adds the text "NA1" in selected cell
        And the user hits enter
        And the user selects row that has the text "NA1" in column with header: "Code"
        And the user clicks on the selected row

        And the user clicks the "Management" tab selected by title

        #Data table: select data table of the required section
        Given the user selects the data table of section: "Variance accounts"

        #Data table: check the selected cell is disabled
        When the user selects cell with column header: "Account" and row number: 2
        Then the selected cell is disabled

        #Data table: check the selected cell is enabled
        When the user selects cell with column header: "Account" and row number: 7
        Then the selected cell is enabled

        #Data table: select a disabled cell
        When the user selects the disabled cell with column header: "Account" and row number: 2

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314K2 - Data Table management - How to check a data table column header is displayed or hidden

        #Open function by code
        Given the user opens the "GESGAS" function

        #Select Sales order transaction
        And the user selects the data table in the popup
        And the user selects cell with text: "STDSP Transaction with hidden field" and column header: ""
        And the user clicks on the selected cell

        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Site"
        And the user writes "NA011" to the selected text field
        And the user selects the text field with name: "Entry type"
        And the user writes "SPINV" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes a generated date in the selected date field using the value "M/T/Y"
        And the user selects the text field with name: "Default description"
        And the user writes "Test column heade display" to the selected text field


        And the user clicks the "Lines" tab selected by title

        #Select the data table and click on it to ensure all the visible columns are properly displayed
        And the user selects the fixed data table for x3 field name: "WMAC2STDSP_ARRAY_NBLIG"
        And the user selects last editable cell with column header: "BP"
        And the user clicks on the selected cell

        # And the user selects the fixed data table for x3 field name: "WMAC2STDSP_ARRAY_NBLIG"

        #Fixed part of the data table
        #Data table: verify the column header with name is displayed
        Then the column header with name "Site" of the selected data table is displayed

        #Data table: verify the column header with X3 field name is displayed
        Then the column header with X3 field name "WMAC2STDSP_FCYLIN" of the selected data table is displayed

        #Data table: verify the column header with name is hidden
        Then the column header with name "Ctrl." of the selected data table is hidden

        #Data table: verify the column header with X3 field name is hidden
        Then the column header with X3 field name "WMAC2STDSP_SAC1" of the selected data table is hidden


        #None Fixed part of the data table
        #Data table: verify the column header with name is displayed
        Then the column header with name "BP" of the selected data table is displayed

        #Data table: verify the column header with X3 field name is displayed
        Then the column header with X3 field name "WMAC2STDSP_BPR" of the selected data table is displayed

        #Data table: verify the column header with name is hidden
        Then the column header with name "Tax" of the selected data table is hidden

        #Data table: verify the column header with X3 field name is hidden
        Then the column header with X3 field name "WMAC2STDSP_TAX" of the selected data table is hidden

        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314K3 - Data Table management - How to verify the value of the choice of the selected cell is displayed or hidden

        Given the user opens the "GESSOH" function

        #Select sales order transaction
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Sales site"
        And the user writes "FR011" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes a generated date in the selected date field using the value "T"
        And the user selects the text field with name: "Sold-to"
        And the user writes "DE011" to the selected text field

        #Select management section
        #Verification of the Tax rule & currency used on the sales invoice.
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Tax rule"
        And the user writes "CEE" to the selected text field

        #Set delivery information
        And the user clicks the "Delivery" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes "FR011" to the selected text field

        #Set invoicing information
        And the user clicks the "Invoicing" tab selected by title
        And the user selects the text field with name: "Payment term"
        And the user writes "FRSDD30FM" to the selected text field

        And the user clicks the "Lines" tab selected by title

        #Set sales order lines information
        And the user selects the fixed data table of section: "Lines"
        And the user selects last fixed cell with header: "Product"
        And the user adds the text "DIS009" in selected cell
        And the user selects last editable cell with column header: "Ordered qty."
        And the user adds the text "4" in selected cell
        And the user selects last editable cell with column header: "Gross price"
        And the user adds the text "150" in selected cell

        #Data table: verify the value of the choice of the selected cell is displayed or hidden
        And the user selects last editable cell with column header: "Product source"
        Then the "Normal" choice of the selected cell is displayed
        Then the "PO - Receive and ship" choice of the selected cell is displayed
        Then the "Work order" choice of the selected cell is displayed
        Then the "PO - Direct to customer" choice of the selected cell is hidden

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314K4 - Logout scenario
        And the user logs-out from the system