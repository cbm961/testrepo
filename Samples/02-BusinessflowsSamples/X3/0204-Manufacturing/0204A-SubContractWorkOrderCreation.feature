###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0204A-SubContractWorkOrderCreation
# - Description:
#       1) Create subonctract workorder.
#
# - Created date: 16/11/2020
# - Updated date: 03/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0204A-SubContractWorkOrderCreation

    Scenario: 0204A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0204A1 - Create subcontract Workorder

        #Open function by code
        Given the user opens the "GESMFG" function

        #Select Work order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Work orders ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Planning site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Production site"
        And the user writes "ATP21" to the selected text field and hits tab key

        When the user clicks the "Header" tab selected by title
        And the user selects the fixed data table of section: "Products released"
        And the user selects last fixed cell with header: "Product"
        And the user adds the text "SFI903" in selected cell and hits enter key

        #Fill in lead time information
        And the user selects the date field with name: "End date"
        And the user writes today to the selected date field
        And the user hits tab

        #Fill in lead time information
        And the user selects the text field with name: "Number"
        And the user writes "SFI903" to the selected text field and hits tab key

        #Set the operation on the component
        When the user clicks the "Components" tab selected by title
        And the user selects the fixed data table for x3 field name: "WR1ALL2_ARRAY_NBLIG"
        And the user selects row that has the text "RAW903" in column with header: "Component"
        And the user selects cell with header: "Op." of selected row
        And the user adds the text "10" in selected cell and hits enter key

        #Create work order
        #Work order used in feature: 0308A-ModalDialogManagement
        And the user clicks the "Create" main action button on the right panel

        #Close the log
        Then the user clicks the Close page action icon on the header panel

        #Close the report
        Then the user clicks the Close page action icon on the header panel

        #Stored value: Save the work order reference into a stored value
        And the user selects the text field with name: "Work order"
        And the user stores the value of the selected text field with the key: "ENV_MFGNUM01"

        #Open the header drop down
        When the user opens the header drop down
        When the user opens the "Option" section on the right panel
        And the user clicks the "Sub-con situation" action button on the header drop down

        #Modal dialog: check the modal dialog using both text and stored value
        When the modal dialog "Released product situation Work Order [ENV_MFGNUM01]" is displayed

        #Stored value: check the value of the work order refence corresponds to the stored value
        And the user selects the text field with name: "Work order"
        And the value of the selected text field matches the stored text with key "ENV_MFGNUM01"

        #Close the modal dialog
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0204A2 - Logout scenario
        Then the user logs-out from the system