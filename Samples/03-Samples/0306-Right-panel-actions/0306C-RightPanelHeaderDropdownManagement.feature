##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0306C-RightPanelHeaderDropdownManagement
# - Description: How to interact with right panel header dropdown
#                - How to interact with right panel header drop down action
# - Created date: 17/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0306C-RightPanelHeaderDropdownManagement

    Scenario: 0306C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0306C1 - Right panel action management - How to interact with right panel header drop down action

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
        When the user opens the "Address" section on the right panel

        #Right panel action: close the required section of the header dropdown
        When the user closes the "Address" section on the right panel

        #Right panel action: open the required section of the header dropdown
        When the user opens the "Zooms" section on the right panel

        #Right panel action: click the required action of the header drop down
        Then the user clicks the "Accounting document" action button on the header drop down

        #Close the Tunnel function
        And the user clicks the Close page action icon on the header panel

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0306C2 - Logout scenario
        And the user logs-out from the system