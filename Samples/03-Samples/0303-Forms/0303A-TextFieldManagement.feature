###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303A-TextFieldManagement
# - Description: How to interact with text fields
#                - How to write and verify the text entered in a text field
#                - How to call the text field quick selection
#                - How to call the text field Jump To action
#                - How to call text field more action
#                - How to write a value defined in a static parameter into a text field
# - Created date: 21/01/2020
# - Updated date: 09/10/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303A-TextFieldManagement

    Scenario: 0303A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303A1 - Text field management - How to write and verify the text entered in a text field

        #Open function by code
        Given the user opens the "GESCPY" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Text field: selection by name and verifying the value is empty
        Given the user selects the text field with name: "Company"
        Then the value of the selected text field is empty

        #Text field: selection by name then verifying the value entered
        Given the user selects the text field with name: "Company"
        When the user writes "ATP3" to the selected text field
        Then the value of the selected text field is "ATP3"

        #Text field: select the text field and verify the value at the same time
        Then the value of the "Company" text field is "ATP3"

        #Text field: selection by X3 field name (ScreenCode_FieldName), then entering and verifying the value
        Given the user selects the text field with X3 field name: "CPY0_CPYNAM"
        When the user writes "Sage Company" to the selected text field
        Then the value of the selected text field contains "Sage"

        #Text field: selection by name and enter a value followed by enter
        Given the user selects the text field with name: "Short description"
        When the user writes "Sage" to the selected text field and hits enter key

        Then an alert box with the text "Mandatory field" appears
        And the user clicks the "Ok" opinion in the alert box

        #Text field: alternative solution to write into a text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field

        And the user selects the text field with name: "Country"
        And the user writes "US" to the selected text field

        #Text field: selection by name and enter a value followed by a tabulation
        Given the user selects the text field with name: "Account core model"
        When the user writes "NA1" to the selected text field and hits tab key

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303A2 - Text field management - How to call the text field quick selection

        #Open function by code
        Given the user opens the "GESITM" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Text field: select the text field and call the quick selection
        #Info: "Selection" is in en-US language. Please use the expression required for the language the test is executed
        #Info: The expression to use corresponds to the value displayed in the tooltip when you pass the mouse over the Selection icon
        Given the user selects the text field with name: "Category"
        When the user clicks the "Selection" button of the selected text field
        And the user selects the data table in the popup
        And the user selects search cell with header: "Cat."
        And the user adds the text "FINIV" in selected cell and hits enter key
        And the user selects cell that matches exact with the text: "FINIV" and column header: "Cat."
        And the user clicks on the selected cell

        #Text field: verify the value selected
        And the user selects the text field with name: "Category"
        Then the value of the selected text field is "FINIV"

        #Text field: select the text field and call the quick selection at the same time
        #Info: "Selection" is in en-US language. Please use the expression required for the language the test is executed
        #Info: The expression to use corresponds to the value displayed in the tooltip when you pass the mouse over the Selection icon
        Given the user clicks the "Selection" button on the "Category" text field
        When the user selects the data table in the popup
        And the user selects search cell with header: "Cat."
        And the user adds the text "SFINV" in selected cell and hits enter key
        And the user selects cell that matches exact with the text: "SFINV" and column header: "Cat."
        And the user clicks on the selected cell

        #Text field: verify the value selected
        And the user selects the text field with name: "Category"
        Then the value of the selected text field is "SFINV"

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303A3 - Text field management - How to call the text field Jump To action

        #Open function by code
        Given the user opens the "GESBIS" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Text field: select the text field and call the Jump To action
        #Info: "Jump to" is in en-US language. Please use the expression required for the language the test is executed
        #Info: The expression to use corresponds to the value displayed in the tooltip when you pass the mouse over the Jump To icon
        Given the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field
        When the user clicks the "Jump to" button of the selected text field

        #Check the supplier function is displayed
        Then the "Supplier" screen is displayed

        #Check the correct record as been loaded by default.
        And the user selects the text field with name: "Supplier"
        Then the value of the selected text field is "NA052"

        #Close the supplier fucntion
        And the user clicks the Close page action icon on the header panel

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303A4 - Text field management - How to call text field more action

        #Open function by code
        Given the user opens the "GESBIS" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Text field: select the text field and call the Account action
        Given the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field

        #Text field:  call the action "Account"
        And the user clicks the "Account" option of the actions panel

        Then the "Account inquiry" screen is displayed

        #Close account inquiry function
        And the user clicks the Close page action icon on the header panel

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303A5 - Logout scenario
        And the user logs-out from the system


    Scenario: 0303A6 - Text field management - How to write a value defined in a static parameter into a text field

        #Please note the parameter x3SolutionName used in this example is a parameter defined in the .\cucumber-conflig\parameters file.
        #If you need to work with stored value and data table (using memory), please check the following sample:  0303K-TextFieldandStoredValueManagement

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserRootName" and password "param:loginUserRootPassword"
        And the user changes the main language code to "en-US"

        #Open function by Entity name
        Given the user opens the "X3 solutions" entity

        When the user opens the header drop down
        Then the user clicks the "New X3 solution" action button on the header drop down
        And the user selects the text field with name: "Code"
        And the user writes "EMTST" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Test environment" to the selected text field

        #Text field: write the value defined in the parameter x3SolutionName into the selected text field
        And the user selects the text field with name: "Solution name"
        And the user writes "param:x3SolutionName" to the selected text field

        #Text field: write the value defined in the parameter x3SolutionName into the selected text field and hit tab key
        And the user selects the text field with name: "Solution name"
        And the user writes "param:x3SolutionName" to the selected text field and hits tab key

        #Text field: write the value defined in the parameter x3SolutionName into the selected text field and hit enter key
        And the user selects the text field with name: "Solution name"
        And the user writes "param:x3SolutionName" to the selected text field and hits enter key


    Scenario: 0303A7 - Logout scenario
        And the user logs-out from the system