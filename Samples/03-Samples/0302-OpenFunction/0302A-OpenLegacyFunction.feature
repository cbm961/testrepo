###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0302A-OpenLegacyFunction
# - Description: How to open an X3 Legacy function
#                - How to open an X3 Legacy function by code
# - Created date: 21/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0302A-OpenLegacyFunction

    Scenario: 0302A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0302A1 - Open function management - How to open an X3 Legacy function by code

        #Open function by code
        Given the user opens the "GESCPY" function

        #Check the function is opened
        Then the "Companies" screen is displayed

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0302A2 - Logout scenario
        And the user logs-out from the system