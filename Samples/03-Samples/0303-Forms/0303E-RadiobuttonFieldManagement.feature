###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303E-RadiobuttonFieldManagement
# - Description: How to interact with radio button fields
#                - How to set a radio button field and verify the value selected
# - Created date: 30/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303E-RadiobuttonFieldManagement

    Scenario: 0303E0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303E1 - Radio button management - How to set a radio button field and verify the value selected

        #Open function by code
        Given the user opens the "CPTSVC" function

        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the check box with name: "Generate entries"
        And the user sets the check box to ticked

        #Radio button field: selection of the radio button and control its states and the value selected
        Given the user selects the radio buttons group with name: "Generation type"
        When the user clicks on "Active simulation" radio button of the selected radio buttons group
        Then the radio button "Active simulation" of the selected radio buttons group is selected
        Then the radio button "Actual" of the selected radio buttons group is not selected

        #Radio button field: selection of the radio button by X3 field name (ScreenCode_FieldName)
        Given the user selects the radio buttons group with X3 field name: "CPTSVC_TYP"
        When the user clicks on "Actual" radio button of the selected radio buttons group
        Then the radio button "Actual" of the selected radio buttons group is selected

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303E2 - Logout scenario
        And the user logs-out from the system