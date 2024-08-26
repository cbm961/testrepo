###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 01D-JournalEntryTransactionSetup
# - Description: Setup a journal entry transaction
# - Created date: 23/09/2021
# - Updated date:
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 01D-JournalEntryTransactionSetup

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Setup a journal entry transaction

        Given the user opens the "GESGDE" function
        Then the "Journal entry transactions" screen is displayed

        #Select transaction STDOC from the left panel
        When the user clicks the "Journal entry transactions" link on the left panel
        Given the user selects the data table of left panel
        Then the user selects search cell with header: "Transaction"
        And the user adds the text "STDCO" in selected cell and hits enter key
        And the user selects cell with column header: "Transaction" and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Transaction"
        And the value of the selected text field is "STDCO"
        And the user writes "STDSP" to the selected text field and hits tab key

        And the user selects the text field with name: "Description"
        And the user writes "Transaction with hidden fields" to the selected text field

        #Setup the lines data table
        And the user clicks the "Line" tab selected by title
        And the user selects the data table with x3 field name: "GDIAENTRY3_ARRAY_NBRFLD"
        And the user selects row that has the text "Control - Legal" in column with header: "Description"
        And the user selects cell with header: "Entry mode" of selected row
        And the user selects the choice "Hidden" of the selected cell

        And the user selects row that has the text "Tax" in column with header: "Description"
        And the user selects cell with header: "Entry mode" of selected row
        And the user selects the choice "Hidden" of the selected cell

        And the user clicks the "Create" main action button on the right panel

        And an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" option in the alert box

        And the user clicks the "Validation" button in the header

        And the user clicks the Close page action icon on the header panel


    Scenario: Logout scenario
        Then the user logs-out from the system