###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314J-PasswordFieldStateVerification
# - Description: How to check the state of password field
#                - How to check a password field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314J-PasswordFieldStateVerification

    Scenario: 0314J0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314J1 - Password field management - How to check a password field is displayed or hidden

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        Given the user clicks the "New user" action button on the header drop down
        Then the user selects the text field with name: "Login"
        And the user writes "ADMC3" to the selected text field

        #Password field: verify the password field is displayed
        Then the password field with name: "New password" is displayed

        #Password field: verify the password field is hidden
        Then the password field with name: "Hiddenfield" is hidden


    Scenario: 0314J2 - Logout scenario
        And the user logs-out from the system