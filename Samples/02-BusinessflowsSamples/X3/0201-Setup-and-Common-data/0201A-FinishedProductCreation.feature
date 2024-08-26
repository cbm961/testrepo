###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0201A-FinishedProductCreation
# - Description:
#       1) Creation of Finished product.
#
# - Created date: 18/11/2020
# - Updated date: 10/02/2021
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0201A-FinishedProductCreation

    Scenario: 0201A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0201A1 - Finished Product creation
        #Open Product function
        Given the user opens the "GESITM" function
        When the "Product" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Header information
        When the user selects the text field with name: "Category"
        And the user writes "FINIS" to the selected text field
        When the user selects the text field with name: "Description"
        And the user writes "Scott moutain bike" to the selected text field

        #Management Tab
        When the user clicks the "Management" tab selected by title
        And the user selects the radio buttons group with name: "Stock management"
        Then the radio button "Managed" of the selected radio buttons group is selected

        And the user selects the text field with name: "Product type"
        And the value of the selected text field is "Finished and intermediate goods"

        #Management Tab
        When the user clicks the "Units of measure" tab selected by title
        And the user selects the text field with name: "Stock unit"
        And the value of the selected text field is "UN"

        #Financial Tab
        When the user clicks the "Financials" tab selected by title
        And the user selects the text field with name: "Accounting code"
        And the value of the selected text field is "FINPRODUCT"
        And the user selects the text field with name: "Tax level 1"
        And the value of the selected text field is "NOR"

        #analytical informaiton
        When the user selects the data table of section: "Analytical"
        And the user selects row that has the text "CCT" in column with header: "Dimension type code"
        And the user selects cell with header: "Dimension" of selected row
        And the user adds the text "COMM-001" in selected cell and hits enter key

        #Confirm creation message
        And the user clicks the "Create" main action button on the right panel
        Then an alert box with the text containing "The Product was created" appears
        And the user clicks the "Ok" option in the alert box

        #Save the product reference in a stored value
        And the user selects the text field with name: "Product"
        And the user stores the value of the selected text field with the key: "ENV_PRODUCT01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0201A2 - Logout scenario
        Then the user logs-out from the system