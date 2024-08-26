##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code : 0316A-LockManagmentExample01
# - Description : How to parallelize tests and to prevent locks for occurring in X3 / Warehousing
# - Created date : 05/11/2020
# - Updated date : 27/02/2023
###########################################################################

@SageX3AutomatedTestPlatform  @LCK_GESBIC
Feature: 0316A-LockManagmentExample01

    Scenario: 0316A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0316A1 - Lock management - Add lock LCK_GESBIC
        And the user adds the lock entry "LCK_GESBIC"


    Scenario: 0316A2 - Lock management - Modify customer invoice

        #Open function by code
        Given the user opens the "GESBIC" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Customer BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "DIR000023" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Modify the Customer Invoice
        Then the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
        And the user clicks the "Delete all" action in the left top bar of the selected data table

        And the user selects last editable cell with column header: "Site"
        And the user clicks on the selected cell
        And the user selects last editable cell with column header: "Leg./Ana USA"
        And the user adds the text "41100" in selected cell
        And the user selects last editable cell with column header: "Amount - tax"
        And the user adds the text "1000.00" in selected cell
        And the user selects last editable cell with column header: "Tax"
        And the user adds the text "USTAX" in selected cell

        #Add dimension value on Dimension type "Cost center"
        And the user selects last editable cell with column header: "Cost Center"
        And the user adds the text "ACCT-001" in selected cell

        #Add dimension value on Dimension type "Market"
        And the user selects last editable cell with column header: "Market"
        And the user adds the text "SERVICE" in selected cell


        #Invoice Creation & Posting
        Then the user clicks the "Save" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0316A3 - Lock management - Remove lock LCK_GESBIC
        And the user removes the lock entry "LCK_GESBIC"


    Scenario: 0316A4 - Logout scenario
        Then the user logs-out from the system