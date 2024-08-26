###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314M-FunctionEntityStateVerification
# - Description: How to check the state of a function or entity
#                - How to check a function entity is displayed or hidden
# - Created date: 13/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314M-FunctionEntityStateVerification

    Scenario: 0314M0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314M1 - Function / entity  management - How to check a function entity is displayed or hidden

        #Function: Check a function is displayed using function code
        Then the function "GESSOH" in the site map is displayed
        Then the function "BSIIMP" in the site map is displayed

        #Function: Check a function is hidden using function code
        Then the function "YHDFCT" in the site map is hidden

        #Entity: Check an entity is displayed
        Then the entity "Bank transactions management" in the site map is displayed

        #Entity: Check an entity is hidden
        Then the entity "HiddenEntity" in the site map is hidden


    Scenario: 0314M2 - Logout scenario
        And the user logs-out from the system