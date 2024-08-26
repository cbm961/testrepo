###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303K-PasswordFieldManagement
# - Description: How to interact with password fields
#                - How to set a password fields
# - Created date: 11/03/2020
# - Updated date: 31/01/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303K-PasswordFieldManagement

    Scenario: 0303K0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303K1 - Password field management -  How to set a password field

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        Given the user clicks the "New user" action button on the header drop down
        And the user selects the text field with name: "Login"
        And the user writes "ADMC3" to the selected text field

        #Password fields: Select the password and confirmation field and enter the required password value
        Given the user selects the password fields with name: "New password"
        And the user writes "MyNewPassword" password to the selected password field
        And the user writes "MyNewPassword" password to the selected password confirmation field
        And the user hits tab
        And the user takes a screenshot

        #Cancel the user creation
        When the user open the main page clicking on the logo
        Then an alert box with the text "You have unsaved changes" appears
        And the user clicks the "Continue" opinion in the alert box


    Scenario: 0303K2 - Logout scenario
        And the user logs-out from the system