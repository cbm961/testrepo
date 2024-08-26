###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0301A-DynamicLoginConnection
# - Description:  How to connect to sage X3
#                 - How to connect in X3 using login type, user and password defined in the parameters file
# - Created date: 28/01/2020
# - Updated dates: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0301A-DynamicLoginConnection

    Scenario: 0301A1 - Login scenario management - How to connect in X3 using login type, user and password defined in the parameters file

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Select the en-US Language
        And the user changes the main language code to "en-US"

        #Endpoint selection passed in parameter
        When the user selects the "param:endPointName1" entry on endpoint panel

        #Verification of the endpoint selected
        Then the "param:endPointName1" endpoint is selected

        #Disconnection from X3
        Then the user logs-out from the system