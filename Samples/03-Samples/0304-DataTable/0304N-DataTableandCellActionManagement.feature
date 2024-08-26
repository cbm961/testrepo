##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304N-DataTableandCellActionManagement
# - Description: How to use cell more action or quick selection
#                - How to interact with the cell more action and quick selection
# - Created date: 05/03/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304N-DataTableandCellActionManagement

    Scenario: 0304N0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304N1 - Data Table management - How to interact with the cell more action and quick selection

        #Open Sales order function
        Given the user opens the "GESPOH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase order ALL : Full entry" screen is displayed

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Define the header information
        And the user selects the text field with name: "Order site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field

        And the user clicks the "Lines" tab selected by title

        #Data table: select the fixed part of the data table.
        And the user selects the fixed data table of section: "Lines"

        #Cell action: use the cell quick selection to select the product
        #Info: "Selection" is in en-US language. Please use the expression required for the language the test is executed
        #Info: The expression to use corresponds to the value displayed in the tooltip when you pass the mouse over the Selection icon
        Given the user selects last fixed cell with header: "Product"
        When the user clicks the "Selection" action button of the selected cell
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Description 1"
        And the user adds the text "ATPPRD01" in selected cell and hits enter key
        And the user selects cell with column header: "Description 1" and row number: 1
        And the user clicks on the selected cell

        #Cancel the line
        And the user hits escape

        #Data table: select the fixed part of the data table.
        And the user selects the fixed data table of section: "Lines"

        #Cell action: use the Products action to Jump in the Product function
        Given the user selects last fixed cell with header: "Product"
        Then the user adds the text "BMS013" in selected cell
        When the user clicks the "Products" option of the actions panel for the selected cell
        Then the "Product" screen is displayed
        And the user selects the text field with name: "Product"
        And the value of the selected text field is "BMS013"

        #Close product functionality
        And the user clicks the Close page action icon on the header panel

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303N2 - Logout scenario
        And the user logs-out from the system