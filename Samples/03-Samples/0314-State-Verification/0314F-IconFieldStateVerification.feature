###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314F-IconFieldStateVerification
# - Description: How to check the state of an icon field
#                - How to check an icon field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314F-IconFieldStateVerification

    Scenario: 0314F0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314F1 - Icon field management - How to check an icon field is displayed or hidden

        #Open function by code
        Given the user opens the "GESITM" function
        Then the "Product" screen is displayed

        #Icon field: verify the icon field with name is displayed
        Then the icon field with name: "PLM history" is displayed

        #Icon field: verify the icon field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the icon field with X3 field name: "ITM1_BUTHISURL" is displayed

        #Icon field: verify the icon field with name is hidden
        Then the icon field with name: "Hiddenfield" is hidden

        #Icon field: verify the icon field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the icon field with X3 field name: "ITM1_HDFIELD" is hidden

        #Close Product function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314F2 - Logout scenario
        And the user logs-out from the system