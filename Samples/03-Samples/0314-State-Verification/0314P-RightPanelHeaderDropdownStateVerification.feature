##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314P-RightPanelHeaderDropdownStateVerification
# - Description: How to check the state of the header drop down action
#                - How to check the header drop down action is enabled or disabled
# - Created date: 23/09/2021
# - Updated date:23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314P-RightPanelHeaderDropdownStateVerification

    Scenario: 0314P0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314P1 - Right panel action management - How to check the header drop down action is enabled or disabled

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000003" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Right panel action: open the header drop down
        Given the user opens the header drop down

        #Right panel action: open the required section of the header dropdown
        When the user opens the "Zooms" section on the right panel

        #Right panel action: check the action of the header drop down is enabled
        Then the "Accounting document" action button on the header drop down is enabled

        #Right panel action: check the action of the header drop down is disabled
        Then the "Withholdings on payment" action button on the header drop down is disabled

        #Right panel action: click the required action of the header drop down
        Then the user clicks the "Accounting document" action button on the header drop down


        #Close the Tunnel function
        And the user clicks the Close page action icon on the header panel

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314P2 - Logout scenario
        And the user logs-out from the system