###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304B-DynamicDataTableManagement
# - Description: How to Interact with dynamic data table (no predifined rows)
#                - Selection of the main data table of the page
#                - Selection of data table of section
#                - Selection of data table with x3 field name
# - Created date: 04/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304B-DynamicDataTableManagement

    Scenario: 0304B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304B1 - Dynamic Data Table management - How to select the main data table of the page and interact with it

        #Open function by code
        Given the user opens the "GESTPT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Payment term"
        And the user writes "NAWTR60" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Transfer 60 days net" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "NAWTR60" to the selected text field

        #Data table: select the main data table of the page
        Given the user selects the main data table of the page

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Method"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Due date %"
        Then the user adds the text "20" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Days"
        Then the user adds the text "60" in selected cell

        #Data table: select a value in the selected drop down list
        When the user selects last editable cell with column header: "Month end"
        Then the user selects the choice "End of next month" of the selected cell

        And the user hits enter

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Method"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Due date %"
        Then the user adds the text "80" in selected cell

        #Data table: enter a value in the selected Text cell and hits enter key
        When the user selects last editable cell with column header: "Days"
        Then the user adds the text "60" in selected cell and hits enter key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304B2 - Dynamic Data Table management - How to select the data table of the section and interact with it

        #Open function by code
        Given the user opens the "GESTPT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Payment term"
        And the user writes "NAWTR60" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Transfer 60 days net" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "NAWTR60" to the selected text field

        #Data table: select data table of the chosen section
        Given the user selects the data table of section: "Management"

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Method"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Due date %"
        Then the user adds the text "20" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Days"
        Then the user adds the text "60" in selected cell

        #Data table: select a value in the selected drop down list
        When the user selects last editable cell with column header: "Month end"
        Then the user selects the choice "End of next month" of the selected cell

        And the user hits enter

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Method"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Due date %"
        Then the user adds the text "80" in selected cell

        #Data table: enter a value in the selected Text cell and hits enter key
        When the user selects last editable cell with column header: "Days"
        Then the user adds the text "60" in selected cell and hits enter key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304B3 - Dynamic Data Table management - How to select the data table with X3 field name and interact with it

        #Open function by code
        Given the user opens the "GESTPT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Payment term"
        And the user writes "NAWTR60" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Transfer 60 days net" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "NAWTR60" to the selected text field

        #Data table: select data table with X3 field name
        Given the user selects the data table with x3 field name: "TPT1_ARRAY_BASTAB"

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_PAM"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_DUDPRC"
        Then the user adds the text "20" in selected cell

        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_NBRDAY"
        Then the user adds the text "60" in selected cell

        #Data table: select a value in the selected drop down list with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_ENDMONFLG"
        Then the user selects the choice "End of next month" of the selected cell

        And the user hits enter

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_PAM"
        Then the user adds the text "WTR" in selected cell

        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName)
        When the user selects last editable cell with X3 field name: "TPT1_DUDPRC"
        Then the user adds the text "80" in selected cell

        #Data table: enter a value in the selected Text cell with X3 field name (ScreenCode_FieldName) and hits enter key
        When the user selects last editable cell with X3 field name: "TPT1_NBRDAY"
        Then the user adds the text "60" in selected cell and hits enter key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0304B4 - Logout scenario
        And the user logs-out from the system