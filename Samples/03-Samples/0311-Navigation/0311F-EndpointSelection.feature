###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311F-EndpointSelection
# - Description: How to select or change an endpoint
#                - How to change an endpoint
#                - How to change an endpoint with condition
#                - How to change an endpoint using the endpoint panel option
# - Created date: 29/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0311F-EndpointSelection

    Scenario: 0311F1 - Endpoint selection management - How to change an endpoint

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Select the en-US language
        And the user changes the main language code to "en-US"

        #Endpoint selection passed in parameter
        When the user selects the "param:endPointName1" entry on endpoint panel

        #Verification of the endpoint selected
        Then the "param:endPointName1" endpoint is selected

        #Disconnection from X3
        And the user logs-out from the system


    Scenario: 0311F2 - Endpoint selection management - How to change an endpoint with condition

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Select the en-US language
        And the user changes the main language code to "en-US"

        #Endpoint selection passed in parameter with condition
        When the user selects the "param:endPointName1" entry on endpoint panel if it exists

        #Verification of the endpoint selected
        Then the "param:endPointName1" endpoint is selected

        #Disconnection from X3
        And the user logs-out from the system


    Scenario: 0311F3 - Endpoint selection management - How to change an endpoint using the endpoint panel option

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Select the en-US language
        And the user changes the main language code to "en-US"

        #Endpoint selection passed in parameter using the more endpoints panel option
        When the user selects the "param:endPointName1" entry on the more endpoints panel option

        #Verification of the endpoint selected
        Then the "param:endPointName1" endpoint is selected

        #Disconnection from X3
        And the user logs-out from the system