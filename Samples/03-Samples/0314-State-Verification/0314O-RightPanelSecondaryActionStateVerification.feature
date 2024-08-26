##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314O-RightPanelSecondaryActionStateVerification
# - Description: How to check the state of the right panel secondary action
#                - How to check the right panel secondary action is enabled or disabled
# - Created date: 23/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314O-RightPanelSecondaryActionStateVerification

    Scenario: 0314O0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314O1 - Right panel action management - How to check the right panel secondary action is enabled or disabled

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000001" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Right panel action: check the secondary action is enabled
        Given the "Post" secondary action button is enabled

        #Right panel action: click on the secondary action
        When the user clicks the "Post" secondary action button on the right panel
        And the user clicks the "Yes" option in the alert box

        #Right panel action: check the secondary action is disabled
        Then the "Post" secondary action button is disabled

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314O2 - Logout scenario
        And the user logs-out from the system