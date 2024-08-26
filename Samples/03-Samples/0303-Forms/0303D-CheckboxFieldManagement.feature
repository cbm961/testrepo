###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303D-CheckboxFieldManagement
# - Description: How to interact with checkbox fields
#                - How to check or uncheck a checkbox field
# - Created date: 30/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303D-CheckboxFieldManagement

    Scenario: 0303D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303D1 - Checkbox management - How to check or uncheck a checkbox field

        #Open function by code
        Given the user opens the "GESBPC" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Category"
        And the user writes "US" to the selected text field
        And the user selects the text field with name: "Customer"
        And the user writes "USAU02" to the selected text field

        #Select Tab Identity
        And the user clicks the "Identity" tab selected by title

        #Checkbox field: tick the checkbox and verifying the checkbox is checked
        Given the user selects the check box with name: "Intersite"
        When the user sets the check box to ticked
        Then the selected check box is checked

        #Checkbox field: untick the checkbox and verifying the checkbox is not checked
        Given the user selects the check box with name: "Intersite"
        When the user sets the check box to unticked
        Then the selected check box is not checked

        #Checkbox field: other possible verification
        Then the selected check box is unchecked

        #Checkbox field: selection of the checkbox by X3 field name (ScreenCode_FieldName)
        Given the user selects the check box with X3 field name: "BPRBPC_BETFCY"
        When the user clicks on the selected check box
        Then the selected check box is checked

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303D2 - Logout scenario
        And the user logs-out from the system