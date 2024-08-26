##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0309B-ConfirmationDialogManagement
# - Description: How to interact with confirmation dialogs
#                - How to interact with confirmation dialogs
#                - How to interact with confirmation dialog than alert box
# - Created date: 27/02/2020
# - Updated date:23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0309B-ConfirmationDialogManagement

    Scenario: 0309B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0309B1 - Message box management - How to interact with confirmation dialogs

        #Open function by code
        Given the user opens the "GESAPN" function

        #Entering required data
        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Menu profile"
        And the user writes "MENSP" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "Menu sample" to the selected text field
        And the user selects the text field with name: "Start menu"
        And the user writes "GDOC" to the selected text field

        Then the user clicks the "Create" main action button on the right panel

        #Confirmation dialog: check a confirmation dialog appears with the exact message
        Then a confirmation dialog appears with the message "Record has been created"

        #Confirmation dialog: check a confirmation dialog appears and contains a specific text
        Then a confirmation dialog appears containing the message "Record"

        #Confirmation Dialog: click on the close action on the confirmation dialog
        And the user clicks "Close" button on the confirmation dialog

        #Close the function
        And the user clicks the Close page action icon on the header panel



    Scenario: 0309B2 - Message box management - How to interact with confirmation dialog than alert box

        #Open function by code
        Given the user opens the "GESAPN" function

        Then the user selects the text field with name: "Menu profile"
        And the user writes "MENSP" to the selected text field and hits tab key

        #Delete the menu profile
        Then the user clicks the "Delete" main action button on the right panel

        #Confirmation dialog: click on the OK action
        Given the user clicks "OK" button on the confirmation dialog

        #Alert box: verification of the message displayed
        Then an alert box with the text "User menu profile Deletion 0 MENSP" appears

        #Alert box: confirmation by clicking on the ok action
        And the user clicks the "Ok" opinion in the alert box

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0309B3 - Logout scenario
        And the user logs-out from the system