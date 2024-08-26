###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314D-RadiobuttonFieldStateVerification
# - Description: How to check the state of a radio buttons group field
#                - How to check a radio button field is enabled or disabled
#                - How to check a radio button field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314D-RadiobuttonFieldStateVerification

    Scenario: 0314D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314D1 - Radio button management - How to check a radio button field is enabled or disabled

        #Open function by code
        Given the user opens the "CPTSVC" function
        Then the modal dialog "Closing accruals" is displayed

        Then the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field
        And the user selects the check box with name: "Generate entries"
        And the user sets the check box to ticked

        #Radio button field: selection of the radio button and control its states and the value selected
        Given the user selects the radio buttons group with name: "Generation type"
        Then the radio button "Actual" of the selected radio buttons group is enabled
        When the user clicks on "Active simulation" radio button of the selected radio buttons group

        #Radio button field: verification the radio button is deactivated.
        Given the user selects the radio buttons group with name: "Entry status"
        Then the radio button "Temporary" of the selected radio buttons group is disabled

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314D2 - Radio button management - How to check a radio button field is displayed or hidden

        #Open function by code
        Given the user opens the "CPTSVC" function
        Then the modal dialog "Closing accruals" is displayed

        #Radio button field: verify the radio button field with name is displayed
        Then the radio buttons group with name: "Generation type" is displayed

        #Radio button field: verify the radio button field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the radio buttons group with X3 field name: "CPTSVC_TYP" is displayed

        #Radio button field: verify the radio button field with name is hidden
        Then the radio buttons group with name: "Hiddenfield" is hidden

        #Radio button field: verify the radio button field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the radio buttons group with X3 field name: "CPTSVC_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314D3 - Logout scenario
        And the user logs-out from the system