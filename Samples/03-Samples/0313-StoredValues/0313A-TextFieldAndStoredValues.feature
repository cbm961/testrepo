###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313A-TextFieldAndStoredValues
# - Description: How to interact with text fields and (user) stored values
#                - How to write both text and stored value into a text field and check its content
#                - How to write both text and user stored value into a text field and check its content
#                - How to save a text field value in memory and compare it with the value defined in a text field
#                - How to store a value and compare it with the value defined in a text field
#                - How to generate a dynamic sequence and store the value and enter it into a text field
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313A-TextFieldAndStoredValues

    Scenario: 0313A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313A1 - Text field management - How to write both text and stored value into a text field and check its content

        Given the user opens the "GESBIS" function

        When the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "DIR" to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        #Generate two dynamic sequences of 5 digits each and store the values
        And the user stores the generated value with length 5 with the key "ENV_SEQ05A"
        And the user stores the generated value with length 5 with the key "ENV_SEQ05B"

        #Text field: selection of the text field and write a value defined with the following text and sored value
        And the user selects the text field with name: "Source document"
        And the user writes "ATP-[ENV_SEQ05A]-[ENV_SEQ05B]" to the selected text field

        #Text field: selection of the text field and check it contains the exact value defined with the following text and stored value
        Given the user selects the text field with name: "Source document"
        Then the value of the selected text field is "ATP-[ENV_SEQ05A]-[ENV_SEQ05B]"

        #Text field: selection of the text field and check it contains a value defined with the following text and stored value
        Given the user selects the text field with name: "Source document"
        Then the value of the selected text field contains "ATP-[ENV_SEQ05A]"

        #Text field: selection of the text field and check it contains the string pattern defined with the following text and stored value
        Given the user selects the text field with name: "Source document"
        Then the value of the selected text field has string pattern "[ENV_SEQ05B]"

        #Text field: selection of the text field and check it contains the exact value defined with the following text and stored value
        Then the value of the "Source document" text field is "ATP-[ENV_SEQ05A]-[ENV_SEQ05B]"

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0313A2 - Text field management - How to write both text and user stored value into a text field and check its content

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left panel: select the required data using the left list
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel

        #Search cell: use the search cell to filter the Document no. using a user stored value
        Then the user selects search cell with header: "Document no."
        And the user adds the text "[USV_INVOICE_NUMBER_01]" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Check values using user stored values
        And the user selects the text field with name: "Document no."
        Then the value of the selected text field is "[USV_INVOICE_NUMBER_01]"

        And the user selects the text field with X3 field name: "BIS0_BPRNAM"
        Then the value of the selected text field is "Kraft [USV_SUPPLIER_NAME_01]"

        #Text field: selection of the text field and check it contains a value defined with the following text and / or user stored value
        Given the user selects the text field with X3 field name: "BIS0_BPRNAM"
        Then the value of the selected text field contains "Kraft [USV_SUPPLIER_NAME_01]"
        Then the value of the selected text field contains "[USV_SUPPLIER_NAME_01]"

        #Text field: selection of the text field and check it contains the string pattern defined with the following text and user stored value
        Given the user selects the text field with X3 field name: "BIS0_BPRNAM"
        Then the value of the selected text field has string pattern "[USV_SUPPLIER_NAME_01]"

        #Text field: selection of the text field and check it contains the exact value defined with the following text and user stored value
        Then the value of the "Document no." text field is "[USV_INVOICE_NUMBER_01]"

        And the user clicks the Close page action icon on the header panel


    Scenario: 0313A3 - Text field management - How to save a text field value in memory and compare it with the value defined in a text field

        #Open function by code
        Given the user opens the "GESBIS" function
        Then the "Supplier BP invoice" screen is displayed

        And the user selects the text field with name: "Document no."

        #Save in memory the value of the selected text field
        Given the value of the selected text field is stored

        #Write the value saved in memory into the selected text field
        When the user writes the stored text value to the selected text field and hits tab key

        #Verify the value of the selected text field matches the value saved in memory
        Then the value of the selected text field matches the stored text value

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313A4 - Text field management - How to store a value and compare it with the value defined in a text field

        #Open function by Entity name
        Given the user opens the "GESBIS" function
        Then the "Supplier BP invoice" screen is displayed

        And the user selects the text field with name: "Document no."

        #Stored value: store the value of the selected text field
        Given the user stores the value of the selected text field with the key: "ENV_InvoiceReference"

        #Stored value: write in the selected text field the value previously stored
        When the user writes the stored text with key "ENV_InvoiceReference" in the selected text field

        #Stored value: verify the value of the selected text field matches the stored value
        Then the value of the selected text field matches the stored text with key "ENV_InvoiceReference"

        #Stored value: write in the selected text field the stored value and hits tab key
        And the user writes the stored text with key "ENV_InvoiceReference" in the selected text field and hits tab key

        #Stored value: write in the selected text field the stored value and hits enter key
        And the user writes the stored text with key "ENV_InvoiceReference" in the selected text field and hits enter key

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313A5 - Text field management - How to generate a dynamic sequence and store the value and enter it into a text field

        Given the user opens the "GESBIS" function

        When the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "DIR" to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        #Stored value: generate a dynamic sequence of 5 digits and store the value
        And the user stores the generated value with length 5 with the key "ENV_SEQ05"

        #Stored value: selection of the text field and write a value defined with the following text and stored value
        Given the user selects the text field with name: "Source document"
        And the user writes "ATP-[ENV_SEQ05]" to the selected text field

        #Stored value: selection of the text field and write the stored value
        Given the user selects the text field with name: "Source document"
        And the user writes the stored text with key "ENV_SEQ05" in the selected text field

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313A6 - Logout scenario
        And the user logs-out from the system