##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0308A-ModalDialogManagement
# - Description: How to interact with modal dialog pages
#                - How to interact with modal dialog pages
# - Created date: 19/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0308A-ModalDialogManagement

    Scenario: 0308A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0308A1 - Modal Dialog page management - How to interact with modal dialog pages

        #Open function by code
        Given the user opens the "FUNCFMINV" function

        #Modal Dialog: check the required modal dialog is opened
        Then the modal dialog "Invoice/Credit memo validation" is displayed

        And the user selects the check box with name: "All companies"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field
        And the user selects the date field with name: "Start date"
        And the user writes today to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes today to the selected date field

        #Modal Dialog: click on the required action
        Then the user clicks the "OK" button in the header

        #Close the log
        And the user clicks the Close page action icon on the header panel


    Scenario: 0308A3 - Logout scenario
        And the user logs-out from the system