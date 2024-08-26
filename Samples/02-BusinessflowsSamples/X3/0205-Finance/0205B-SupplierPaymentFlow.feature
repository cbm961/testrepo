###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0205B-SupplierPaymentFlow
# - Description:
#       1) Create and post a supplier invoice.
#       2) Wait for the accounting task to process the supplier invoice.
#       3) Create the payment via the payment proposal.
#       4) Generate the remittance automatically.
#       5) Generate the bank file.
#       6) Check the bank file has been generated.
# - Created date: 24/06/2020
# - Updated date: 06/01/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0205B-SupplierPaymentFlow

    Scenario: 0205B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0205B1 - Supplier invoice creation

        Given the user opens the "GESBIS" function
        Then the "Supplier BP invoice" screen is displayed

        Given the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "DIR" to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        #Generate a dynamic value and assigned it to the source document field
        And the user stores the generated value with length 5 with the key "ENV_INVBISREF03"
        And the user selects the text field with name: "Source document"
        And the user writes "ATP-BIS3-[ENV_INVBISREF03]" to the selected text field

        And the user selects the text field with name: "Currency"
        And the user writes "USD" to the selected text field
        And the user selects the text field with name: "Amount - tax"
        And the user writes "1000.00" to the selected text field
        And the user selects the text field with name: "Amount + tax"
        And the user writes "1000.00" to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "MTS30" to the selected text field
        And the user selects the text field with name: "Discount/Late charge"
        And the user writes "" to the selected text field
        # And the user selects the text field with name: "1099 box"
        # And the user writes "8" to the selected text field
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is "NTX"
        And the user selects the radio buttons group with name: "Supplier amount type"
        And the user clicks on "Exclude tax" radio button of the selected radio buttons group
        And the user selects the drop down list with name: "Pay approval"
        And the user clicks on "Authorized to pay" option of the selected drop down list

        #Lines Tab fields definition
        Then the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
        And the user selects last editable cell with column header: "Site"
        And the user clicks on the selected cell
        And the user selects last editable cell with column header: "Leg./Ana USA"
        And the user adds the text "70900" in selected cell
        And the user selects last editable cell with column header: "Amount - tax"
        And the user adds the text "1000.00" in selected cell
        And the user selects last editable cell with column header: "Tax"
        And the user adds the text "" in selected cell

        #Add dimension value on Dimension type "Dim type 1"
        And the user selects last editable cell with column header: "Cost Center"
        And the user adds the text "PEND-001" in selected cell

        #Add dimension value on Dimension type "IAStype sec1"
        And the user selects last editable cell with column header: "Market"
        And the user adds the text "SERVICE" in selected cell

        #Invoice Creation & Posting
        # ATP-BIS-003 used in feature: 0306C-RightPanelHeaderDropdownManagement
        #Generated document: PIDATP21*-000003
        Then the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: "ENV_ATPBISNUM03"

        And the user clicks the "Post" button in the header
        And the user clicks the "Yes" opinion in the alert box

        Then the user clicks the Close page action icon on the header panel

    Scenario: 0205B2 - Accounting Task Temporization
        #MAccounting task run every 60s, minimum time to wait until the previous document is posted in accounting
        And the user waits 60 seconds


    Scenario: 0205B3 - Payment creation via payment proposal

        Given the user opens the "PAYPROPAL" function
        Then the modal dialog "Payment proposal" is displayed

        #Set the right payment sign
        And the user selects the radio buttons group with name: "Payment sign"
        And the user clicks on "Expense" radio button of the selected radio buttons group

        #Set the company
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field

        #Set the right payment transaction
        And the user selects the check box with name: "All transactions"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Transaction"
        And the user writes "PAYMT" to the selected text field

        #Set the range of document to process
        And the user selects the check box with name: "All document types"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Entry type"
        And the user writes "SPDIR" to the selected text field
        And the user selects the text field with name: "From entry"
        And the user writes the stored text with key "ENV_ATPBISNUM03" in the selected text field and hits tab key

        #Set the bank
        And the user selects the text field with name: "Bank"
        And the user writes "BATP2" to the selected text field

        #Set the payment grouping
        And the user selects the check box with name: "One item/payment"
        And the user sets the check box to ticked

        #Set the accounting date
        And the user selects the date field with name: "Accounting date"
        And the user writes last day of month to the selected date field

        #Process the selection
        Then the user clicks the "OK" button in the header

        #Verifying the invoice is part of the payment
        Then the user selects the data table of section: "Details"
        And the user selects cell that matches exact with the stored text with the key: "ENV_ATPBISNUM03" and column header: "Invoice"

        #Create the payment
        Then the user clicks the "Create" main action button on the right panel

        #Extract the entry batch reference from the log
        Given a log panel appears
        When the user selects the main log panel of the page
        Then the user selects the main data table of the page
        And the user selects the log panel line containing text "Payment"
        And the user extracts the value from the selected log panel line starting at 30 for 20 characters and stores it in key "ENV_ATPBATCH001"

        #Close the log
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0205B4 - Automatic remittance creation

        Given the user opens the "GENBORREM" function
        Then the modal dialog "Automatic remittance creation" is displayed

        #Set the company
        And the user selects the check box with name: "All companies"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field

        #Set the right payment transaction
        And the user selects the check box with name: "All transactions"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Transaction"
        And the user writes "PAYMT" to the selected text field

        #Set the entry batch
        And the user selects the check box with name: "All entry batches"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Entry batch"
        And the user writes the stored text with key "ENV_ATPBATCH001" in the selected text field

        #set the bank
        And the user selects the check box with name: "All banks"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Bank"
        And the user writes "BATP2" to the selected text field

        And the user selects the text field with name: "Remittance site"
        And the user writes "ATP21" to the selected text field

        #Process the selection
        Then the user clicks the "OK" button in the header

        #Extract the remittance reference from the log
        Given a log panel appears
        When the user selects the main log panel of the page
        Then the user selects the main data table of the page
        And the user selects the log panel line containing text "Deposit"
        And the user extracts the value from the selected log panel line starting at 14 for 20 characters and stores it in key "ENV_ATPFRM001"

        #Close the log
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0205B5 - Generate the bank file

        Given the user opens the "FICMAG" function
        Then the modal dialog "Electronic remittances" is displayed

        #Set the company
        And the user selects the check box with name: "All companies"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field

        #Set the right payment transaction
        And the user selects the check box with name: "All transactions"
        And the user sets the check box to unticked
        And the user selects the text field with name: "Transaction"
        And the user writes "PAYMT" to the selected text field

        #Set the remittance
        And the user selects the text field with name: "From remittance"
        And the user writes the stored text with key "ENV_ATPFRM001" in the selected text field and hits tab key

        #Process the selection
        Then the user clicks the "OK" button in the header


    Scenario: 0205B6 - Check the bank file has been created

        #Check the magnetic file has been generated
        Given a log panel appears
        When the user selects the main log panel of the page
        Then the user selects the main data table of the page
        And the user selects row that has the text "Deposit" in column with X3 field name: "LECFIC_LIGNE"
        And the user selects cell with X3 field name: "LECFIC_LIGNE" of selected row
        And the value of the selected cell has string pattern "*Bank file [BQE]*.xml*"

        #Close the log
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0205B7 - Logout scenario
        Then the user logs-out from the system