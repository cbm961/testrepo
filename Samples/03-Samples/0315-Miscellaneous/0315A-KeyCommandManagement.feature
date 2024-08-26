##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0315A-KeyCommandManagement
# - Description: How to use Key commands
#                - How to use key commands
# - Created date: 03/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0315A-KeyCommandManagement

    Scenario: 0315A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0315A1 - Miscellaneous actions - How to use key commands

        #Open function by code
        Given the user opens the "GESTCU" function
        Then the "Currency" screen is displayed
        And the user selects the text field with name: "Currency"
        And the user writes "USD" to the selected text field

        #Key command: use the tab action
        And the user hits tab

        #Verify the the value of the field description
        Given the user selects the text field with name: "Description"
        Then the value of the selected text field is "US Dollar"

        #Entering in creation mode
        Then the user selects the text field with name: "Currency"
        And the user writes "GBP" to the selected text field

        #Key command: use the enter action
        And the user hits enter

        #Verify the the value of the field description
        Given the user selects the text field with name: "Description"
        Then the value of the selected text field is "British Pound"

        #Entering in creation mode
        Then the user selects the text field with name: "Currency"
        And the user writes "EUR" to the selected text field

        #Key command: use the escape action
        And the user hits escape

        Then the value of the selected text field is "GBP"

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0315A2 - Logout scenario
        And the user logs-out from the system