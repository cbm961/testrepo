##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304H-DataTableandFormsManagement
# - Description: How to interact with forms (Text cell, drop down list etc) in data table
#                - How to interact with Text field and a Dropdown list located in a data table
#                - How to interact with a checkbox located in a data table
#                - How to interact with the select all checkbox of the data table header
#                - How to click on an icon located in a data table
# - Created date: 10/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304H-DataTableandFormsManagement

    Scenario: 0304H0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 034H1 - Data Table management - How to interact with Text field and a Dropdown list located in a data table

        #Open function by code
        Given the user opens the "GESSOH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Enter in creation mode
        When the user clicks the "New" main action button on the right panel

        #Entering header information
        And the user selects the text field with name: "Sales site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Sold-to"
        And the user writes "NA008" to the selected text field

        #Entering delivery information
        And the user clicks the "Delivery" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes "ATP21" to the selected text field

        #Select Lines title to enter line information
        And the user clicks the "Lines" tab selected by title

        #Data table: add value in a Text cell / fixed part of the data table
        Given the user selects the fixed data table of section: "Lines"
        When the user selects last fixed cell with header: "Product"
        Then the user adds the text "BMS012" in selected cell

        #Data table: add value in a Text cell / dynamic part of the data table
        When the user selects last editable cell with column header: "Ordered qty."
        Then the user adds the text "4" in selected cell

        #Data table: set the expected value of the selected dropdown list and check the corresponding value selected
        When the user selects last editable cell with column header: "Allocation type"
        Then the user selects the choice "Detailed" of the selected cell
        And the user hits tab
        When the user selects last editable cell with column header: "Allocation type"
        Then the choice selected of the selected cell is "Detailed"

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304H2 - Data Table management - How to interact with a checkbox located in a data table

        #Open function by code
        Given the user opens the "FASRVAM" function

        #Data table: select the required row
        Given the user selects the data table of section: "Company selection"
        And the user sets rows to display to 50
        When the user selects row that has the text "ATP2" in column with header: "Company"

        #Data table: select and ticked the checkbox and verification the checkbox is ticked
        Then the user selects cell with header: "" of selected row
        And the user ticks the checkbox contained in the selected cell
        Then the value of the checkbox contained in the selected cell is ticked

        #Data table: unticked the checkbox and verification the checkbox is not ticked
        And the user unticks the checkbox contained in the selected cell
        Then the value of the checkbox contained in the selected cell is unticked

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304H3 - Data Table management - How to interact with the select all checkbox of the data table header

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "RECWT USA Wire Transfer Receipts" and column header: ""
        And the user clicks on the selected cell

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "BP"
        And the user writes "NA003" to the selected text field and hits tab key

        #left Panel: open the picking left list and select the required document
        Given the user clicks the "Open items" link on the left panel
        When the user selects the data table of left panel

        #Data table: tick the select all checkbox of the data table
        And the user ticks the select all checkbox contained in the column header

        #Data table: untick the select all checkbox of the data table
        And the user unticks the select all checkbox contained in the column header

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0304H4 - Data Table management - How to click on an icon located in a data table

        #Open function by code
        Given the user opens the "GESECS" function

        And the user selects the text field with name: "Product"
        And the user writes "APPLEWATCHSP" to the selected text field and hits enter key

        #Data table: select the required data table row
        And the user selects the main fixed data table of the page
        And the user selects row that has the text "B" in column with header: "Major version"

        #Data table: select the cell of the selected row containing the icon field and click on it.
        And the user selects cell with header: "Minor versions" of selected row
        And the user clicks on the icon contained in the selected cell

        #Check a new page is opened and verify the value contained in the page.
        And the "Versions" screen is displayed
        And the user selects the main data table of the page
        And the user selects row that has the text "B" in column with header: "Major version"

        And the user clicks the Close page action icon on the header panel

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0304H5 - Logout scenario
        And the user logs-out from the system