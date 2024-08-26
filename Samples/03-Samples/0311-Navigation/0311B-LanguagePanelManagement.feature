###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311B-LanguagePanelManagement
# - Description: How to  or change the connection language
#                - How to change the connection language by name using the more language panel
#                - How to change the main connection language by name
#                - How to change the connection language by code using the more language panel
#                - How to change the main connection language by code
# - Created date: 21/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0311B-LanguagePanelManagement

    Scenario: 0311B1 - Language panel management - How to change the connection language by name using the more language panel

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Language selection by name
        Then the user changes the language to "English (United States)" in the more languages panel

        #Endpoint selection passed in parameter
        And the user selects the "param:endPointName1" entry on endpoint panel

        #Disconnection from X3
        And the user logs-out from the system


    Scenario: 0311B2 - Language panel management - How to change the main connection language by name

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Main Language selection by name
        Then the user changes the main language to "English (United States)"

        #Endpoint selection passed in parameter
        And the user selects the "param:endPointName1" entry on endpoint panel

        #Disconnection from X3
        And the user logs-out from the system


    Scenario: 0311B3 - Language panel management - How to change the connection language by code using the more language panel

        #Connection using Login type, login and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Language selection by code
        Then the user changes the language code to "en-US" in the more languages panel

        #Endpoint selection passed in parameter
        And the user selects the "param:endPointName1" entry on endpoint panel

        #Disconnection from X3
        And the user logs-out from the system


    Scenario: 0311B4 - Language panel management - How to change the main connection language by code

        #Connection using standard login / password using parameters defined in parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

        #Main Language selection by code
        Then the user changes the main language code to "en-US"

        #Endpoint selection passed in parameter
        And the user selects the "param:endPointName1" entry on endpoint panel

        #Disconnection from X3
        And the user logs-out from the system