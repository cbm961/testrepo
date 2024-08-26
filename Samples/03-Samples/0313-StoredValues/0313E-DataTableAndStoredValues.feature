##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313E-DataTableAndStoredValues
# - Description:  How to interact with data tables and (user) stored values
#                 - How to save a cell value in memory and compare it with the value defined in a text field
#                 - How to select a row or a cell based on the stored value and check its content
#                 - How to select a row and call the row action based on the stored value
#                 - How to select a fixed row and call the row action based on the value saved in memory
#                 - How to add in a cell a stored value
#                 - How to add in a cell both text and stored value and check its content
#                 - How to add in a cell both text and user stored value and check its content
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature:  0313E-DataTableAndStoredValues

    Scenario: 0313E0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313E1 - Data Table management - How to save a cell value in memory and compare it with the value defined in a text field

        #Open function by code
        Given the user opens the "GESPIH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Purchase invoices" link on the left panel
        Then the user selects search cell with header: "Site"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Save in memory, the reference of the invoice defined in the selected cell
        Given the value of the selected cell is stored

        #Check the invoice reference stored in memory corresponds to the reference defined in the field Entry number
        When the user selects the text field with name: "Entry number"
        Then the value of the selected text field matches the stored cell value

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E2 - Data Table management - How to select a row or a cell based on the stored value and check its content

        #Open function by code
        Given the user opens the "GESPIH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Purchase invoices" link on the left panel
        Then the user selects search cell with header: "Site"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Site" and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Entry number"

        And the user clicks the "Lines" tab selected by title

        When the user selects the data table of section: "Lines"
        And the user selects cell with column header: "Number" and row number: 1

        #Stored value: store the reference value of the document defined in the selected cell
        When the user stores the value of the selected cell with the key: "ENV_PTHNUM01"

        #Stored value: check the value of the selected cell corresponds to the stored value
        Then the value of the selected cell matches the stored text with key "ENV_PTHNUM01"

        #Stored value: select the editable row based on the reference defined in the stored value
        Then the user selects editable row that has the stored text with the key: "ENV_PTHNUM01" in column with header: "Number"

        #Stored value: select the editable row based on the reference defined in the stored value & X3 field name (ScreenCode_FieldName)
        Then the user selects editable row that has the stored text with the key: "ENV_PTHNUM01" in column with X3 field name: "WE8ALL3_NUMORI"

        #Stored value: select a row based on the reference defined in the stored value
        Given the user selects row that has stored text with the key: "ENV_PTHNUM01" in column with header: "Number"

        #Stored value: select the cell whose the value corresponds exactly to the stored value.
        Then the user selects cell that matches exact with the stored text with the key: "ENV_PTHNUM01" and column header: "Number"

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E3 - Data Table management - How to select a row and call the row action based on the stored value

        #Open Sales order function
        Given the user opens the "GESSOH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

        #Stored value: store the value of the selected text field
        And the user selects the text field with name: "Number"
        And the user stores the value of the selected text field with the key: "ENV_SOHNUM01"

        #Close the function
        And the user clicks the Close page action icon on the header panel

        #Open Sales order inquiry
        Given the user opens the "CONSCSO" function
        Then the "Order inquiry" screen is displayed

        #Search the Sales order for a given company
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field
        Then the user clicks the "Search" main action button on the right panel

        #Stored value: select the row based on the reference defined in the stored value
        Given the user selects the fixed data table for x3 field name: "WMCSOSTD_ARRAY_NBLIG"
        When the user selects row that has stored text with the key: "ENV_SOHNUM01" in column with header: "Order no."

        #Stored value: open a row action whose the document corresponds to the stored value
        Then the user opens "Order [ENV_SOHNUM01]" function on toolbox of the selected row

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Verification the correct Sales order has been selected
        Then the user selects the text field with name: "Number"
        And the value of the selected text field matches the stored text with key "ENV_SOHNUM01"

        #Close the function
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E4 - Data Table management - How to select a fixed row and call the row action based on the value saved in memory

        #Open Sales order function
        Given the user opens the "GESSOH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

        #Save the value of the selected text field in memory
        And the user selects the text field with name: "Number"
        And the value of the selected text field is stored

        #Close the function
        And the user clicks the Close page action icon on the header panel

        #Open Sales order inquiry
        Given the user opens the "CONSCSO" function
        Then the "Order inquiry" screen is displayed

        #Search the Sales order for a given company
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field
        Then the user clicks the "Search" main action button on the right panel

        #Select the fixed row based on the reference defined in memory
        Given the user selects the fixed data table for x3 field name: "WMCSOSTD_ARRAY_NBLIG"
        When the user selects fixed table row that has the stored value in column with X3 field name: "WMCSOSTD_SOHNUM"

        #Open a row action whose the document corresponds to the value saved in memory
        Then the user opens "Order" with stored value function on toolbox of the selected row

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Verification the correct Sales order has been selected
        Then the user selects the text field with name: "Number"
        And the value of the selected text field matches the stored text value

        #Close the function
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E5 - Data Table management - How to add in a cell a stored value

        #Open function by code
        Given the user opens the "GESPIH" function

        #Select purchase invoice transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Left list selection
        And the user clicks the "Purchase invoices" link on the left panel
        And the user selects the data table of left panel
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Entry number"
        And the user stores the value of the selected text field with the key: "ENV_PIHNUM01"

        #Left list selection
        Given the user clicks the "Purchase invoices" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Document no."

        #Stored value: add the stored value in the selected cell
        Then the user adds the stored text with key "ENV_PIHNUM01" in selected cell

        #Stored value: add the stored value in the selected cell and hits tab key
        Then the user adds the stored text with key "ENV_PIHNUM01" in selected cell and hits tab key

        #Stored value: add the stored value in the selected cell and hits enter key
        Then the user adds the stored text with key "ENV_PIHNUM01" in selected cell and hits enter key

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E6 - Data Table management - How to add in a cell both text and stored value and check its content

        #Open function by code
        Given the user opens the "CFGTCT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Response table"
        And the user writes "PTR" to the selected text field

        #Data table: create a new line
        Given the user selects the main fixed data table of the page

        #Stored value: generate a dynamic sequence of 5 digits and store the value
        And the user stores the generated value with length 5 with the key "ENV_SEQ05A"

        #Stored value: selection the cell and write the value defined with the following text and stored value
        Given the user selects last fixed cell with header: "Code"
        And the user adds the text "ATP-[ENV_SEQ05A]-YY" in selected cell
        And the user hits enter

        And the user selects first row of the selected data table

        #Stored value: selection of the cell and check it contains the string pattern defined with the following text and stored value
        Given the user selects cell with header: "Code" of selected row
        Then the value of the selected cell has string pattern "*[ENV_SEQ05A]*"

        #Stored value: selection of the cell and check it contains the exact value defined with the following text and stored value
        Given the user selects cell with header: "Code" of selected row
        Then the value of the selected cell is "ATP-[ENV_SEQ05A]-YY"

        #Stored value: selection of the cell and check it contains a value defined with the following text and stored value
        Given the user selects cell with header: "Code" of selected row
        Then the value of the selected cell contains "ATP-[ENV_SEQ05A]"

        #Stored value: selection of the cell and check it doesn't contain the value defined with the following text and stored value
        Given the user selects cell with header: "Code" of selected row
        Then the value of the selected cell not is "ATX-[ENV_SEQ05A]-YY"

        #Stored value: check if the row contains a the value defined with the following text and stored value
        Then the user checks if there is value: "ATP-[ENV_SEQ05A]-YY" in the selected row


        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E7 - Data Table management - How to add in a cell both text and user stored value and check its content

        #Open function by code
        Given the user opens the "CFGTCT" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        Then the user selects the text field with name: "Response table"
        And the user writes "PTR" to the selected text field

        #Data table: create a new line
        Given the user selects the main fixed data table of the page

        #Stored value: selection the cell and write the value defined with the following text and user stored value
        Given the user selects last fixed cell with header: "Code"
        And the user adds the text "CODE01" in selected cell

        Given the user selects last cell with column header: "Code description (FRA)"
        And the user adds the text "ATP-[USV_CODE_01]-ZZ" in selected cell and hits enter key

        And the user selects first row of the selected data table

        #Stored value: selection of the cell and check it contains the string pattern defined with the following text and user stored value
        Given the user selects cell with header: "Code description (FRA)" of selected row
        Then the value of the selected cell has string pattern "*[USV_CODE_01]*"

        #Stored value: selection of the cell and check it contains the exact value defined with the following text and user stored value
        Given the user selects cell with header: "Code description (FRA)" of selected row
        Then the value of the selected cell is "ATP-[USV_CODE_01]-ZZ"

        #Stored value: selection of the cell and check it contains a value defined with the following text and user stored value
        Given the user selects cell with header: "Code description (FRA)" of selected row
        Then the value of the selected cell contains "ATP-[USV_CODE_01]"

        #Stored value: selection of the cell and check it doesn't contain the value defined with the following text and user stored value
        Given the user selects cell with header: "Code description (FRA)" of selected row
        Then the value of the selected cell not is "ATX-[USV_CODE_01]-ZZ"

        #Stored value: check if the row contains a the value defined with the following text and user stored value
        Then the user checks if there is value: "ATP-[USV_CODE_01]-ZZ" in the selected row


        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313E8 - Logout scenario
        And the user logs-out from the system