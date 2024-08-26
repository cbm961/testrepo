###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314S-QuickSelectionStateVerification
# - Description: How to check the value in the quick selection exists or doesn't exist
#                - How to check the required value in the data table exists
#                - How to check the required value doesn't exist in the data table
# - Created date: 04/11/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314S-QuickSelectionStateVerification

    Scenario: 0314S0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314S1 - Quick selection management - How to check the required value in the data table exists

        Given the user opens the "GESBIS" function

        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Site"

        #Quick selection: Open the text field quick selection
        When the user clicks the "Selection" button of the selected text field

        #Quick selection: search for the required value and check the value exists
        And the user selects the data table in the popup
        And the user selects search cell with header: "Site"
        And the user adds the text "NA011" in selected cell and hits enter key
        And the user selects cell that matches exact with the text: "NA011" and column header: "Site"
        Then the value of the selected cell is "NA011"

        #Close the quick selection
        And the user clicks the Close page action icon on the header panel

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314S2 - Quick selection management - How to check the required value doesn't exist in the data table

        Given the user opens the "GESBIS" function

        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Site"

        #Quick selection: Open the text field quick selection
        When the user clicks the "Selection" button of the selected text field

        #Quick selection: search for the required value that shouldn't be found
        And the user selects the data table in the popup
        And the user selects search cell with header: "Site"

        When the user adds the text "NEX01" in selected cell and hits enter key

        #Check the value required is not found
        Then an alert box with the text containing "No Records Selected" appears
        And the user clicks the "Ok" option in the alert box

        #Cancel the creation
        When the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314S3 - Logout scenario
        And the user logs-out from the system