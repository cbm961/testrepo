###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314B-DateFieldStateVerification
# - Description: How to check the state of a date field
#                - How to check a date field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314B-DateFieldStateVerification

    Scenario: 0314B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314B1 - Date field management - How to check a date field is displayed or hidden

        #Open function by code
        Given the user opens the "GESBIC" function
        Then the "Customer BP invoice" screen is displayed

        #Date field: verify the date field with name is displayed
        Then the date field with name: "Accounting date" is displayed

        #Date field: verify the date field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the date field with X3 field name: "BIC0_ACCDAT" is displayed

        #Date field: verify the date field with name is hidden
        Then the date field with name: "Hiddenfield" is hidden

        #Date field: verify the date field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the date field with X3 field name: "BIC0_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314B2 - Logout scenario
        And the user logs-out from the system