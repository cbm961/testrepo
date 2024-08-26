##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0306B-RightPanelSecondaryActionManagement
# - Description: How to interact with the secondary action of the right panel
#                - How to interact with the secondary action of the right panel
# - Created date: 17/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0306B-RightPanelSecondaryActionManagement

    Scenario: 0306B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0306B1 - Right panel action management - How to interact with the secondary action of the right panel

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000001" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Right panel action: click on the secondary action
        When the user clicks the "Open items" secondary action button on the right panel

        #Close the open item edit screen
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0306B2 - Logout scenario
        And the user logs-out from the system