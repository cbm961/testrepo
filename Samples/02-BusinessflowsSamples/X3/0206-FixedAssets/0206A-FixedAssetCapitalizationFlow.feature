###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0206A-FixedAssetCapitalizationFlow
# - Description:
#       1) Create and post a supplier invoice.
#       2) Check the corresponding expense created.
#       3) Create fixed asset by capitalization of the expense and check values & depreciation plan
#
# - Created date: 18/11/2020
# - Updated date: 06/10/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0206A-FixedAssetCapitalizationFlow

    Scenario: 0206A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0206A1 - Supplier invoice creation

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

        And the user stores the generated value with length 5 with the key "ENV_INVBISREF04"
        And the user selects the text field with name: "Source document"
        And the user writes "ATP-BIS4-[ENV_INVBISREF04]" to the selected text field
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
        And the user adds the text "17000" in selected cell
        And the user selects last editable cell with column header: "Amount - tax"
        And the user adds the text "1000.00" in selected cell
        And the user selects last editable cell with column header: "Tax"
        And the user adds the text "" in selected cell

        #Add dimension value on Dimension type "Dim type 1"
        And the user selects last editable cell with column header: "Cost Center"
        And the user adds the text "COMM-001" in selected cell

        #Add dimension value on Dimension type "IAStype sec1"
        And the user selects last editable cell with column header: "Market"
        And the user adds the text "SERVICE" in selected cell

        #Invoice Creation & Posting
        # ATP-BIS-004 used in feature: 0306C-RightPanelHeaderDropdownManagement
        #Generated document: PIDATP21*-000004
        Then the user clicks the "Create" main action button on the right panel

        And the user clicks the "Post" button in the header
        And the user clicks the "Yes" opinion in the alert box

        #Check the expense has been created and get the expense reference
        When a log panel appears
        And the user selects the main log panel of the page
        And the user selects the log panel line containing text "Generated expense(s)" occurrence 1
        And the user extracts the value from the selected log panel line starting at 24 for 17 characters and stores it in key "ENV_CODLOF01"
        And the user extracts the value from the selected log panel line starting at 44 for 1 characters and stores it in key "ENV_CODLOFLINE01"
        Then the selected log panel includes the confirmation message "1 Generated expense(s)"

        #Close the log
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0206A2 - Check the expense created

        Given the user opens the "GESLOF" function
        Then the "Expenses STD : Transaction standard" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Expenses" link on the left panel
        Then the user selects search cell with header: "Ref"
        And the user adds the stored text with key "ENV_CODLOF01" in selected cell
        Then the user selects search cell with header: "Line no."
        And the user adds the stored text with key "ENV_CODLOFLINE01" in selected cell and hits enter key
        And the user selects cell with column header: "Ref" and row number: 1
        And the user clicks on the selected cell

        #Check the expense has been selected
        And the user selects the text field with name: "Reference"
        Then the value of the selected text field matches the stored text with key "ENV_CODLOF01"


        #Check expense amount- tax
        When the user clicks the "Main" tab selected by title
        And the user selects the text field with name: "Amount - tax"
        And the value of the selected text field is "1,000.00"

        #Check expense allocation
        When the user clicks the "Allocations" tab selected by title
        When the user selects the data table with x3 field name: "LOF2_ARRAY_NBRCCE"
        And the user selects row that has the text "CCT" in column with header: "Dimension type code"
        And the user selects cell with header: "Analytical dimension" of selected row
        And the value of the selected cell is "COMM-001"
        And the user selects row that has the text "MAR" in column with header: "Dimension type code"
        And the user selects cell with header: "Analytical dimension" of selected row
        And the value of the selected cell is "SERVICE"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0206A3 - Create fixed asset by Expense Capitalization

        Given the user opens the "GESFAS" function

        #Select Fixed assets transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "STD Transaction standard" and column header: ""
        And the user clicks on the selected cell

        Then the "Assets STD : Transaction standard" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Financial site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Description 1"
        And the user writes "Dell computer" to the selected text field

        #Select the expense using Capitalize action
        When the user clicks the "Capitalize" button in the header

        When the user selects the fixed data table of section: "Selection"
        And the user selects row that has stored text with the key: "ENV_CODLOF01" in column with header: "Reference"
        And the user selects fixed cell with X3 field name: "LOFLDAB_SELFLG" of selected row
        And the user ticks the checkbox contained in the selected cell


        And the user selects the text field with name: "Acct group"
        And the user writes "COMPUTER" to the selected text field

        When the user clicks the "Apply" button in the header

        #Check Fixed assets values
        When the user clicks the "Main" tab selected by title
        And the user selects the text field with name: "Family"
        Then the value of the selected text field is "COMPUTER"

        And the user selects the text field with name: "Accounting code"
        Then the value of the selected text field is "NA17200"

        And the user selects the drop down list with name: "Fixed asset type"
        Then the value of the selected drop down list is "Tangible"

        And the user selects the text field with name: "Tax excl. input val"
        Then the value of the selected text field is "1,000.00"

        #Check Allocations information
        When the user clicks the "Allocations" tab selected by title
        When the user selects the data table with x3 field name: "FAS2_ARRAY_NBRCCE"
        And the user selects row that has the text "CCT" in column with header: "Dimension type code"
        And the user selects cell with header: "Analytical dimension" of selected row
        And the value of the selected cell is "COMM-001"
        And the user selects row that has the text "MAR" in column with header: "Dimension type code"
        And the user selects cell with header: "Analytical dimension" of selected row
        And the value of the selected cell is "SERVICE"

        #Check Depreciation information
        When the user clicks the "Depreciation" tab selected by title
        When the user selects the fixed data table of section: "Depreciation plans"
        And the user selects row that has the text "Accounts" in column with header: "Plan"
        And the user selects cell with header: "Method" of selected row
        And the value of the selected cell is "RE"
        And the user selects cell with header: "Prorata" of selected row
        And the choice selected of the selected cell is "Day"
        And the user selects cell with header: "Duration" of selected row
        And the value of the selected cell is "5.000"

        Then the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0206A4 - Logout scenario
        Then the user logs-out from the system