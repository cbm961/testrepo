###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313D-PasswordFieldAndStoredValues
# - Description: How to interact with password fields and (user) stored values
#                - How to interact with password fields using stored value
#                - How to interact with password fields using user stored value
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313D-PasswordFieldAndStoredValues

    Scenario: 0313D1 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313D2 - Password field management - How to interact with password fields using stored value

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        Given the user clicks the "New user" action button on the header drop down
        Then the user selects the text field with name: "Login"
        And the user writes "ADMC3" to the selected text field

        #Generate a dynamic sequence of 8 digits and save it into a stored value
        And the user stores the generated value with length 8 with the key "ENV_DYN_PASSWORD"

        #Password fields: Select the password and confirmation field and enter the dynamic password value
        Given the user selects the password fields with name: "New password"
        And the user writes "[ENV_DYN_PASSWORD]" password to the selected password field
        And the user writes "[ENV_DYN_PASSWORD]" password to the selected password confirmation field
        And the user hits tab

        #Cancel the user creation
        When the user open the main page clicking on the logo
        Then an alert box with the text "You have unsaved changes" appears
        And the user clicks the "Continue" opinion in the alert box


    Scenario: 0313D3 - Password field management - How to interact with password fields using user stored value

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        Given the user clicks the "New user" action button on the header drop down
        Then the user selects the text field with name: "Login"
        And the user writes "ADMC3" to the selected text field


        #Password fields: Select the password and confirmation field and enter the password value contained in the user stored value
        Given the user selects the password fields with name: "New password"
        And the user writes "[USV_PASSWORD_01]" password to the selected password field
        And the user writes "[USV_PASSWORD_01]" password to the selected password confirmation field
        And the user hits tab

        #Cancel the user creation
        When the user open the main page clicking on the logo
        Then an alert box with the text "You have unsaved changes" appears
        And the user clicks the "Continue" opinion in the alert box


    Scenario: 0313D4 - Logout scenario
        And the user logs-out from the system