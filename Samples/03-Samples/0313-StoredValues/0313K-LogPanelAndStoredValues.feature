##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313K-LogPanelAndStoredValues
# - Description: How to interact with log panel and (user) stored values
#                - How to check a confirmation message in a log panel using both text and stored value
#                - How to extract a document reference from the log and save it in a stored value
# - Created date: 13/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313K-LogPanelAndStoredValues

    Scenario: 0313K0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313K1 - Log Panel management - How to check a confirmation message in a log panel using both text and stored value

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000002" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: "ENV_ATPBISNUM02"

        #Close GESBIS function
        And the user clicks the Close page action icon on the header panel

        #Open function by code
        Given the user opens the "BPSVAL" function

        Then the modal dialog "Supplier invoice posting" is displayed

        #Set criteria
        And the user selects the check box with name: "All companies"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field
        And the user selects the check box with name: "All users"
        And the user sets the check box to ticked
        And the user selects the text field with name: "From invoice"
        And the user writes the stored text with key "ENV_ATPBISNUM02" in the selected text field
        And the user selects the text field with name: "To invoice"
        And the user writes the stored text with key "ENV_ATPBISNUM02" in the selected text field

        And the user selects the check box with name: "Log file"
        Then the selected check box is checked

        And the user clicks the "OK" button in the header

        #Log panel: check a log is displayed
        Given a log panel appears

        #Log panel: selection of the main log panel
        When the user selects the main log panel of the page

        #Log panel: check the confirmation message is retuned in the log using both Text and stored value
        Then the selected log panel includes the confirmation message "Validated document: [ENV_ATPBISNUM02]"


    Scenario: 0313K2 - Log Panel management - How to extract a document reference from the log and save it in a stored value

        #Extract the supplier invoice from the log and save it ina stored value
        Given the user selects the main data table of the page

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "Validated"

        #This step definition allows to define which occurrence of the text searched, to select (it is possible to select occurence from 1 to 10)
        When the user selects the log panel line containing text "Validated" occurrence 1
        Then the user extracts the value from the selected log panel line starting at 21 for 17 characters and stores it in key "ENV_ATPBISNUM02B"

        #Close the log
        And the user clicks the Close page action icon on the header panel

        #Wait for the accounting task to proceed the supplier invoice posting
        And the user waits 60 seconds

        #Rollback the posting
        Given the user opens the "GESBIS" function
        When the "Supplier BP invoice" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the stored text with key "ENV_ATPBISNUM02B" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        When the user opens the header drop down
        And the user opens the "Function" section on the right panel
        And the user clicks the "Accounting cancellation" action button on the header drop down
        And an alert box with the text "Confirm the cancellation?" appears
        And the user clicks the "Yes" opinion in the alert box

        #Close sales invoice function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313K3 - Logout scenario
        And the user logs-out from the system