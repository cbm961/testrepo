###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314L-TabStateVerification
# - Description: How to check the state of a tab
#                - How to check a tab is displayed or hidden
# - Created date: 13/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314L-TabStateVerification

    Scenario: 0314L0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314L1 - Tab management - How to check a tab is displayed or hidden

        #Open function by code
        Given the user opens the "GESFAS" function

        #Select Fixed assets transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "NCSN No concession" and column header: ""
        And the user clicks on the selected cell

        Then the "Assets NCSN : No concession" screen is displayed

        #Tab: Check the tab with title is displayed
        Then the tab with title "Main" is displayed
        Then the tab with title "Allocations" is displayed
        Then the tab with title "Depreciation" is displayed
        Then the tab with title "Tax" is displayed
        Then the tab with title "Receipt/disposal" is displayed
        Then the tab with title "Other info" is displayed
        Then the tab with title "Revaluations" is displayed

        #Tab: Check the tab with title is hidden
        Then the tab with title "Concession" is hidden

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314L2 - Logout scenario
        And the user logs-out from the system