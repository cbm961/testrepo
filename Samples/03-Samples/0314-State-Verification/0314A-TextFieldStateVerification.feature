###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314A-TextFieldStateVerification
# - Description: How to check the state of a text field
#                - How to check a text field is enabled or disabled
#                - How to check a text field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 05/02/2024
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314A-TextFieldStateVerification

    Scenario: 0314A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314A1 - Text field management - How to check a text field is enabled or disabled

        #Open function by code
        Given the user opens the "GESBPC" function
        Then the "Customer" screen is displayed

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Category"
        And the user writes "US" to the selected text field
        And the user selects the text field with name: "Customer"
        And the user writes "USAU01" to the selected text field

        #Text field: verification the Text field is disabled
        And the user clicks the "Identity" tab selected by title
        Given the user selects the text field with name: "Site"
        Then the selected text field should be disabled

        #Text field: verification the Text field is enabled
        When the user selects the check box with name: "Intersite"
        And the user clicks on the selected check box
        Then the selected text field should be enabled

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314A2 - Text field management - How to check a text field is displayed or hidden

        #Open function by code
        Given the user opens the "GESBPC" function
        Then the "Customer" screen is displayed

        #Text field: verify the text field with name is displayed
        Then the text field with name: "Category" is displayed

        #Text field: verify the text field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the text field with X3 field name: "BPC0_BCGCOD" is displayed

        #Text field: verify the text field with name is hidden
        Then the text field with name: "Hiddenfield" is hidden

        #Text field: verify the text field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the text field with X3 field name: "BPC0_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314A3 - Text field management - Verification of a text field displayed or hidden by programming

        #Open Sales order function
        Given the user opens the "GESSIH" function

        #Select sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

        And the user selects the text field with name: "Invoice no."
        And the user writes "FR0230206FACLI000003" to the selected text field and hits tab key

        #Text field: verify the text field with name is hidden
        Then the text field with X3 field name: "SIH0_INVTYPSPA" is hidden
        Then the text field with name: "Spanish invoice type" is hidden

        And the user selects the text field with name: "Invoice no."
        And the user writes "FAC-ES02314-000006" to the selected text field and hits tab key

        #Text field: verify the text field with name is displayed
        Then the text field with X3 field name: "SIH0_INVTYPSPA" is displayed
        Then the text field with name: "Spanish invoice type" is displayed


    Scenario: 0314A4 - Logout scenario
        And the user logs-out from the system