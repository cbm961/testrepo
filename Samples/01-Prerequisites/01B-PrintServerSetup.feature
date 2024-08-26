###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 01B-PrintServerSetup
# - Description: Setup the print serveur for the current folder
# - Created date: 24/06/2020
# - Updated date: 06/04/2023
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 01B-PrintServerSetup

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: Update PREVISU printserver value

        Given the user opens the "GESAIM" function
        Then the "Destinations" screen is displayed

        And the user selects the text field with name: "Code"
        And the user writes "PREVISU" to the selected text field and hits enter key
        And the user clicks the "Selection" button on the "Server" text field
        And the user waits 10 seconds
        And the user clicks the "Save" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel


    Scenario: Logout scenario
        Then the user logs-out from the system