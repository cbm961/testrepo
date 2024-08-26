###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 01C-BusinessObjectTransactionSetup
# - Description: Setup a business object transaction
# - Created date: 13/08/2021
# - Updated date:
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 01C-BusinessObjectTransactionSetup

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Setup a Business object transaction

        Given the user opens the "GESTSH" function
        Then the "Business object transactions" screen is displayed

        Given the user clicks the "New" main action button on the right panel

        #Set header fields
        And the user selects the drop down list with name: "Object"
        And the user clicks on "Asset" option of the selected drop down list
        And the user selects the text field with name: "Transaction"
        And the user writes "NCSN" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "No concession" to the selected text field

        # Remove the tab concession
        And the user selects the data table of section: "Personalisation of the tabs"
        And the user selects row that has the text "Asset - concession" in column with header: "Screen title"
        And the user selects cell with header: "Visible" of selected row
        And the user unticks the checkbox contained in the selected cell

        Given the user clicks the "Create" main action button on the right panel

        And the user clicks the "Validation" button in the header


        And the user clicks the Close page action icon on the header panel


    Scenario: Logout scenario
        Then the user logs-out from the system