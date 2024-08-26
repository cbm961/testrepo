##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0309A-AlertBoxManagement
# - Description: How to interact with alert box
#                - How to interact with alert box
# - Created date: 27/02/2020
# - Updated date: 16/01/2024
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0309A-AlertBoxManagement

    Scenario: 0309A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0309A1 - Message box management - How to interact with alert box

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000001" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Duplicate the invoice
        Then the user selects the text field with name: "Document no."
        And the user writes "" to the selected text field and hits enter key


        #Alert box: check the alert box title
        Given an alert box appears with the title "Warning"

        #Alert box: check an alert box appears
        Then an alert box appears

        #Alert box: check the alert box appears with the following exact message
        Then an alert box with the text "Reference entered on invoice PIDATP2124-000001" appears

        #Alert box: check the alert box appears and contains a specific value
        Then an alert box with the text containing "Reference entered on invoice" appears

        #Alert box: Click on the Cancel action of the alert box
        Then the user clicks the "Cancel" option in the alert box

        #Alert box: Check no alert box appears
        Then an alert box does not appear

        And the user clicks the "Cancel" main action button on the right panel

        Then the user selects the text field with name: "Document no."
        And the user writes "" to the selected text field and hits enter key

        #Alert box: dismiss the alert box
        And the user dismisses the alert box

        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0309A2 - Logout scenario
        And the user logs-out from the system