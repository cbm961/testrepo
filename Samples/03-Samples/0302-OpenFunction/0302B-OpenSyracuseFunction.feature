###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0302B-OpenSyracuseFunction
# - Description: How to open an X3 Syracuse function
#                - How to open an X3 Syracuse function by entity name
# - Created date: 21/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0302B-OpenSyracuseFunction

    Scenario: 0302B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0302B1 - Open function management - How to open an X3 Syracuse function by entity name

        #Open function by Entity name
        Given the user opens the "Bank transactions management" entity

        #Check the function is opened
        Then the "Bank transaction management" screen is displayed

        #Come back to the main page
        And the user goes to the main page


    Scenario: 0302B2 - Logout scenario
        And the user logs-out from the system