###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0201B-CustomerCreation
# - Description:
#       1) Creation of customer.
#
# - Created date: 18/11/2020
# - Updated date: 16/01/2024
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0201B-CustomerCreation

    Scenario: 0201B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0201B1 - French Customer creation

        #open customer function
        Given the user opens the "GESBPC" function
        And the "Customer" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Category"
        And the user writes "FR" to the selected text field
        And the user selects the text field with name: "Customer"
        And the user writes "FR099" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "My cust." to the selected text field
        And the user selects the text field with name: "Company name 1"
        And the user writes "My customer" to the selected text field
        And the user selects the text field with name: "Site tax ID no."
        And the user writes "123456782" to the selected text field
        And the user selects the text field with name: "SIC code"
        And the user writes "349" to the selected text field
        And the user selects the text field with name: "EU VAT no."
        And the user writes "FR11123456782" to the selected text field

        #Set Addresses information
        And the user clicks the "Addresses" tab selected by title

        And the user selects the data table of section: "Addresses"
        And the user selects last editable cell with column header: "Address code"
        And the user adds the text "AD1" in selected cell and hits enter key
        And the user selects the text field with name: "Description"
        And the user writes "Main Address" to the selected text field
        And the user selects the text field with X3 field name: "BPABPC_XADDLIG1"
        And the user writes "Avenue des frères lumières" to the selected text field
        And the user selects the text field with name: "Postal code"
        And the user writes "69008" to the selected text field and hits tab key
        And the user selects the text field with name: "City"
        And the user writes "LYON" to the selected text field

        #Set Financial information
        And the user clicks the "Financial" tab selected by title

        And the user selects the text field with name: "Tax rule"
        And the user writes "FRA" to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "FRSDD30FM" to the selected text field

        #Create the customer
        When the user clicks the "Create" main action button on the right panel

        Then a confirmation dialog appears with the message "Record has been created"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0201B2 - Logout scenario
        Then the user logs-out from the system