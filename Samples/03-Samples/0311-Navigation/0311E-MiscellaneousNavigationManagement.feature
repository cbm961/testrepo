##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311E-MiscellaneousNavigationManagement
# - Description: How to open the sitemap or come back to the main page.
#                - How to open the sitemap or come back to the main page
# - Created date: 02/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0311E-MiscellaneousNavigationManagement

    Scenario: 0311D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0311E1 - Navigation management - How to open the sitemap or come back to the main page

        #Open the Site map
        Given the user opens the sitemap

        #Come back to the main page by clicking on Sage Logo
        And the user open the main page clicking on the logo


    Scenario: 0311E2 - Logout scenario
        And the user logs-out from the system