###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code : PurchaseOrders
# - Description :
# - Legislation :
# - JIRA ID : '-XXXX'
# - Created by :
# - Created date - 2024-01-09
# - Updated by :
# - Updated date :  
###########################################################################

Feature: PurchaseOrders
    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: PO Creation
        # Call Function by code
        Given the user opens the "GESPOH" function
        Then the "Purchase order P2P : P2P PROJECT" screen is displayed

        When the user clicks the "New" main action button on the right panel
        #Set header fields
        And the user selects the text field with name: "Supplier"
        And the user writes "Sup000004" to the selected text field
        And the user selects the text field with name: "Site"
        And the user writes "01000" to the selected text field
        And the user selects the text field with name: "Requester"
        And the user writes "301330" to the selected text field
        And the user selects the text field with name: "Signatory ACT"
        And the user writes "HRS20" to the selected text field
        And the user selects the drop down list with name: "Order Type"
        And the user clicks on "PO from PR" option of the selected drop down list
        #Then an alert box with the text "Type PO cannot be empty or \"PO from PR\"" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user hits tab
        #Then an alert box with the text "Type PO cannot be empty or \"PO from PR\"" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the drop down list with name: "Order Type"
        And the user clicks on "Tech PO : fixed amount" option of the selected drop down list

        #Set Line field
        When the user selects the data table of section: "Lines"
        And the user selects cell with column header: "Product code" and row number: 1
        And the user adds the text "0000400" in selected cell
        And the user selects cell with column header: "Qty" and row number: 1
        And the user adds the text "1" in selected cell
        And the user selects cell with column header: "Unit price" and row number: 1
        And the user adds the text "100" in selected cell
        And the user selects cell with column header: "ACT" and row number: 1
        And the user adds the text "HRS20" in selected cell
        And the user selects cell with column header: "PRJ" and row number: 1
        And the user adds the text "000020" in selected cell
        And the user selects the text field with name: "Workflow comments*"
        And the user writes block of text to the selected text area
            """
            Project approved for launch
            Approved by project supervisor
            """
        And the user hits tab
        And the user clicks the "Create" main action button on the right panel
        #Check FP&A WF enabled
        Then the user clicks the "FP&A WF" button in the header
        And an alert box with the text "Please check the attachements...workflow not transmisted..." appears
        And the user clicks the "Ok" opinion in the alert box

        #Check Info WF enabled
        When the user selects the drop down list with name: "Order Type"
        And the user clicks on "Tech PO : External" option of the selected drop down list
        And the user clicks the "Save" main action button on the right panel
        And the user clicks the "Info WF" button in the header
        Then an alert box with the text "Please check the attachements...workflow not transmisted..." appears
        And the user clicks the "Ok" opinion in the alert box

    Scenario: PO Duplication
        When the user selects the text field with name: "Order no."
        And the user writes "" to the selected text field
        And the user selects the drop down list with name: "Order Type"
        And the user clicks on "Tech PO : fixed amount" option of the selected drop down list

        And the user hits tab
        And the user selects the text field with name: "Workflow comments*"
        And the user writes block of text to the selected text area
            """
            Project approved for launch
            Approved by project supervisor
            """
        #Then a confirmation dialog appears with the message "Dates and prices recalculated"
        #And the user clicks "OK" button on the confirmation dialog
        And the user clicks the "Create" main action button on the right panel

        And an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with name: "Signature Status"

        #Check status INFO WF when order type = Tech PO: External
        Then the value of the selected text field is "FP&A WF to launch"

        #Check status INFO WF when order type = Tech PO: External
        When the user selects the drop down list with name: "Order Type"
        And the user clicks on "Tech PO : External" option of the selected drop down list
        Then the user selects the text field with name: "Signature Status"
        And the value of the selected text field is "Info WF to launch"
        And the user clicks the "Save" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: Logout scenario
        Then the user logs-out from the system
