###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314Q-LeftPanelStateVerification
# - Description: How to check the data table of the left panel is empty
#                - How to check the data table of the left panel returns no data
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314Q-LeftPanelStateVerification

    Scenario: 0314Q0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314Q1 - Left Panel management - How to check the data table of the left panel returns no data

        Given the user opens the "GESSDH" function

        #Select delivery transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Left panel: Check the data table of the left panel is empty
        Given the user clicks the "Deliveries" link on the left panel
        When the user selects the data table of left panel
        And the user selects search cell with header: "Delivery no."
        And the user adds the text "NotExistingValue" in selected cell and hits enter key
        Then the selected data table of the left panel is empty

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314Q2 - Logout scenario
        And the user logs-out from the system