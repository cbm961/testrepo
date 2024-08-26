###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314C-CheckboxFieldStateVerification
# - Description: How to check the state of a checkbox field
#                 - How to to check a checkbox field is enabled or disabled
#                 - How to check a checkbox field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314C-CheckboxFieldStateVerification

    Scenario: 0314C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314C1 - Checkbox management - How to to check a checkbox field is enabled or disabled

        #Open function by code
        Given the user opens the "GESBPC" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Category"
        And the user writes "US" to the selected text field
        And the user selects the text field with name: "Customer"
        And the user writes "USAU02" to the selected text field


        #Checkbox field: verifying the checkbox is disabled
        Given the user selects the check box with name: "Miscellaneous BP"
        Then the selected check box is disabled

        #Checkbox field: verifying the checkbox is enabled
        Given the user selects the check box with name: "Service supplier"
        Then the selected check box is enabled

        #Checkbox field: selection of the checkbox by X3 field name and verifying the checkbox is disabled
        Given the user selects the check box with X3 field name: "BPRBPC_BPTFLG"
        Then the selected check box is disabled

        #Checkbox field: selection of the checkbox by X3 field name and verifying the checkbox is enabled
        Given the user selects the check box with X3 field name: "BPRBPC_DOOFLG"
        Then the selected check box is enabled

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314C2 - Checkbox management - How to check a checkbox field is displayed or hidden

        #Open function by code
        Given the user opens the "GESBPC" function
        Then the "Customer" screen is displayed


        #Checkbox field: verify the checkbox field with name is displayed
        Then the check box field with name: "Miscellaneous BP" is displayed

        #Checkbox field: verify the checkbox field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the check box field with X3 field name: "BPRBPC_BPRACC" is displayed

        #Checkbox field: verify the checkbox field with name is hidden
        Then the check box field with name: "Hiddenfield" is hidden

        #Checkbox field: verify the checkbox field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the check box field with X3 field name: "BPRBPC_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314C3 - Logout scenario
        And the user logs-out from the system