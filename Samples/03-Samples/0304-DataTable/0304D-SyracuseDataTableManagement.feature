###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304D-SyracuseDataTableManagement
# - Description: How to Interact with Syracuse data table
#                - How to interact with Syracuse data table
# - Created date: 04/02/2020
# - Updated date: 05/04/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304D-SyracuseDataTableManagement

    Scenario: 0304D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304D1 - Syracuse Data Table management - How to interact with Syracuse data table

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        #Data table: select a specific row and click on the Toolbox action "Detail"
        When the user selects the main data table of the page
        And the user selects row that has the text "XATP" in column with header: "Login"
        And the user opens "Detail" function on toolbox of the selected row


        #Come back to the previous screen
        And the user clicks the "Users" action button on the header drop down

        #Data table: click on the link cell to display the user information
        And the user clicks on the link in the cell that has the text "XATP" in cell with header: "Login"

        #Come back to the previous screen
        And the user clicks the "Users" action button on the header drop down


    Scenario: 0304D2 - Logout scenario
        And the user logs-out from the system