##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0305B-TabSelectionManagement
# - Description: How to select tab
#                - How to select tab by title and navigate in the page
# - Created date: 02/03/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0305B-TabSelectionManagement

    Scenario: 0305B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0305B1 - Page action management - How to select tab by title and navigate in the page

        #Open function by code
        Given the user opens the "GESBPR" function

        Then the "Business partner" screen is displayed

        #Page action: select Identity tab
        Then the user clicks the "Identity" tab selected by title
        And the user waits 1 seconds

        #Page action: select Addresses tab
        Then the user clicks the "Addresses" tab selected by title
        And the user waits 1 seconds

        #Page action: select BP/Company tab
        Then the user clicks the "BP/Company" tab selected by title
        And the user waits 1 seconds

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0305B2 - Logout scenario
        And the user logs-out from the system