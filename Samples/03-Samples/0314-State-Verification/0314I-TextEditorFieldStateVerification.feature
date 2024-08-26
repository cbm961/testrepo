###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314I-TextEditorFieldStateVerification
# - Description: How to check the state of a text editor field
#                - How to check a text editor field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314I-TextEditorFieldStateVerification

    Scenario: 0314I0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314I1 - Text editor management - How to check a text editor field is displayed or hidden

        #Open function by code
        Given the user opens the "GESFPT" function
        Then the "Reminder texts" screen is displayed

        #Text editor field: verify the text editor field of section is displayed
        Then the text editor field of section: "Header text" is displayed

        #Text editor field: verify the text editor field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the text editor field with X3 field name: "FPT1_TXT2" is displayed

        #Text editor field: verify the text editor field of section is hidden
        Then the text editor field of section: "Hiddenfield" is hidden

        #Text editor field: verify the text editor field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the text editor field with X3 field name: "FPT1_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314I2 - Logout scenario
        And the user logs-out from the system