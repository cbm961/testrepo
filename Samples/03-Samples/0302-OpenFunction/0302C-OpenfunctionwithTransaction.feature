###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0302C-OpenfunctionwithTransaction
# - Description: How to open an X3 Legacy function and select the required screen transaction
#                - How to open an X3 Legacy function requiring to select a transaction
# - Created date: 06/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0302C-OpenfunctionwithTransaction

    Scenario: 0302C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0302C1 - Open function management - How to open an X3 Legacy function requiring to select a transaction

        #Open function by code
        Given the user opens the "GESSOH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        And the user waits 2 seconds

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0302C2 - Logout scenario
        And the user logs-out from the system