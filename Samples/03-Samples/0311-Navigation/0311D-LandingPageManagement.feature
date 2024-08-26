##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311D-LandingPageManagement
# - Description: How to interact with landing pages
#                - How to interact with landing pages
#                - How to interact with standard landing pages
# - Created date: 27/02/2020
# - Updated date: 15/01/2024
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0311D-LandingPageManagement

    Scenario: 0311D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0311D1 - Landing page management - How to interact with standard landing pages

        #Landing page: check the user is on the default landing page
        Given the landing page is displayed

        #Landing page: open the standard landing page
        When  the user selects the "A/R accounting manager" standard landing page

        #Landing page: check the landing page title changed
        Then the page Landing Page title changes to "A/R accounting manager"


    # Scenario: 0311D2 - Landing page management - How to interact with user landing pages

    #     #Landing page: check the user is on the default landing page
    #     Given the landing page is displayed

    #     #Landing page: open the user landing page
    #     When the user selects the "My Personnal Page" user landing page

    #     #Landing page: check the landing page title changed
    #     Then the page Landing Page title changes to "My Personnal Page"


    Scenario: 0311D3 - Logout scenario
        And the user logs-out from the system