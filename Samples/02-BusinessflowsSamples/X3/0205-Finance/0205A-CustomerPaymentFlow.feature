###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0205A-CustomerPaymentFlow
# - Description:
#       1) Create and post a customer invoice.
#       2) Wait for the accounting task to process the customer invoice.
#       3) Create the payment manually by picking of the customer invoice.
#       4) Create the remittance by selection of the payment
#       5) Post the remittance and check the accounting journal entry is created.
#
# via manual payment creation, then create, post the remittance
# - Created date: 24/06/2020
# - Updated date: 22/06/2021
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0205A-CustomerPaymentFlow

    Scenario: 0205A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0205A1 - Customer invoice creation

        Given the user opens the "GESBIC" function
        Then the "Customer BP invoice" screen is displayed

        Given the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "DIR" to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Customer"
        And the user writes "NA003" to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        #Generate a dynamic value and assigned it to the source document field
        And the user stores the generated value with length 5 with the key "ENV_INVBICREF03"
        And the user selects the text field with name: "Source document"
        And the user writes "ATP-BIC3-[ENV_INVBICREF03]" to the selected text field

        And the user selects the text field with name: "Currency"
        And the user writes "USD" to the selected text field
        And the user selects the text field with name: "Amount - tax"
        And the user writes "1000.00" to the selected text field
        And the user selects the text field with name: "Amount + tax"
        And the user writes "1070.00" to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "DWTR30" to the selected text field
        And the user selects the text field with name: "Early discounts/Late charges"
        And the user writes "" to the selected text field
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is "NTX"
        And the user selects the radio buttons group with name: "Amount type"
        And the user clicks on "Exclude tax" radio button of the selected radio buttons group

        #Lines Tab fields definition
        Then the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
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
        Then the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: "ENV_ATPBICNUM03"

        And the user clicks the "Post" button in the header
        And the user clicks the "Yes" opinion in the alert box

        #Close the function
        Then the user clicks the Close page action icon on the header panel

    Scenario: 0205A2 - Accounting Task Temporization
        #MAccounting task run every 60s, minimum time to wait until the previous document is posted in accounting
        And the user waits 60 seconds


    Scenario: 0205A3 - RECWT customer payment creation by picking of the customer invoice

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "RECWT USA Wire Transfer Receipts" and column header: ""
        And the user clicks on the selected cell
        Then the "Wire Transfer Receipts" screen is displayed


        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "BP"
        And the user writes "NA003" to the selected text field and hits tab key
        And the user selects the date field with name: "Accounting date"
        And the user writes last day of month to the selected date field
        And the user selects the text field with name: "Bank"
        And the user writes "BATP2" to the selected text field
        And the user selects the text field with name: "BP amount"
        And the user writes "1070" to the selected text field and hits tab key

        #left Panel: open the picking left list and select the required document
        Given the user clicks the "Open items" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Number"
        And the user adds the stored text with key "ENV_ATPBICNUM03" in selected cell and hits enter key
        And the user selects cell with column header: "Number" and row number: 1
        And the user clicks on the selected cell


        #Payment creation
        Then the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Payment no."
        And the user stores the value of the selected text field with the key: "ENV_ATPRECWTNUM01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0205A4 - Remittance creation by picking of the customer payment

        #Open function by code
        Given the user opens the "GESFRM" function
        Then the "Manual remittance entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Bank"
        And the user writes "BATP2" to the selected text field
        And the user selects the text field with name: "Payment type"
        And the user writes "RECWT" to the selected text field and hits tab key


        #left Panel: open the picking left list and select the required document
        Given the user clicks the "Payments" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Payment no."
        And the user adds the stored text with key "ENV_ATPRECWTNUM01" in selected cell and hits enter key
        And the user selects cell with column header: "Payment no." and row number: 1
        And the user clicks on the selected cell

        #Remittance creation
        Then the user clicks the "Create" main action button on the right panel


    Scenario: 0205A5 - Remittance posting and check the journal entry has been created

        #Remittance posting
        Given the user clicks the "Post" button in the header
        Then the modal dialog "Posting" is displayed
        And the user clicks the "OK" button in the header

        #Check the document has been validated
        Given a log panel appears
        When the user selects the main log panel of the page
        Then the user selects the main data table of the page
        And the user selects row that has the text "Document" in column with X3 field name: "LECFIC_LIGNE"
        And the user selects cell with X3 field name: "LECFIC_LIGNE" of selected row
        And the value of the selected cell has string pattern "*Document creation REC*"

        #Close the log
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0205A6 - Logout scenario
        Then the user logs-out from the system