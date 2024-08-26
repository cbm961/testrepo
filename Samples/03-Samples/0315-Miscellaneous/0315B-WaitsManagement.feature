##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0315B-WaitsManagement
# - Description: How to use waits
#                - How to use waits
# - Created date: 03/03/2020
# - Updated date: 23/03/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0315B-WaitsManagement

    Scenario: 0315B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0315B1 - Miscellaneous actions - How to use waits

        #Open function by code
        Given the user opens the "GESPIH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Select the purchase invoice in the left list
        Given the user selects the data table of left panel
        When the user clicks the "Purchase invoices" link on the left panel
        Then the user selects search cell with header: "Site"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Entry number"
        And the user stores the value of the selected text field with the key: "ENV_ATPPIHNUM01"

        When the user clicks the "Post" secondary action button on the right panel
        Then an alert box with the text containing "The document will be validated!" appears
        And the user clicks the "Ok" opinion in the alert box
        Then a log panel appears
        And the user clicks the Close page action icon on the header panel

        #Waits: add a timer of 60s to wait for the accounting task to process the purchase invoice posting
        Then the user waits 60 seconds

        Then the user opens the header drop down
        Then the user opens the "Zooms" section on the right panel
        And the user clicks the "Accounting document" secondary action button on the right panel


        Given the "Journal entry STDCO : Column complete transaction" screen is displayed
        When the user selects the text field with name: "Number"
        Then the value of the selected text field matches the stored text with key "ENV_ATPPIHNUM01"

        #Close journal entry function
        And the user clicks the Close page action icon on the header panel

        #Cancel the posting
        When the user opens the header drop down
        And the user opens the "Functions" section on the right panel
        And the user clicks the "Accounting cancellation" secondary action button on the right panel
        Then an alert box with the text "Confirm the cancellation?" appears
        And the user clicks the "Yes" opinion in the alert box

        #Waits: Add a default waits
        And the user waits

        #Close sales invoice function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0315B2 - Logout scenario
        And the user logs-out from the system