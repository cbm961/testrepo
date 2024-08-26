##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311A-ProfilePanelManagement
# - Description: How to interact with profile panel
#                 - How to interact with the profile panel
# - Created date: 02/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0311A-ProfilePanelManagement

    Scenario: 0311A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0311A1 - Navigation management - How to interact with the profile panel

        #Profile panel: open profile panel and click on Animations button
        Given the user opens the profile panel
        When the user clicks on the left function "Display" on profile panel
        Then the user clicks on the toggle button with the text "Animations"


    Scenario: 0311A2 - Logout scenario
        And the user logs-out from the system